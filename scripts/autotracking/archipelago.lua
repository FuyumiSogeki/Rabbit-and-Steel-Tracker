-- this is an example/ default implementation for AP autotracking
-- it will use the mappings defined in item_mapping.lua and location_mapping.lua to track items and locations via thier ids
-- it will also load the AP slot data in the global SLOT_DATA, keep track of the current index of on_item messages in CUR_INDEX
-- addition it will keep track of what items are local items and which one are remote using the globals LOCAL_ITEMS and GLOBAL_ITEMS
-- this is useful since remote items will not reset but local items might
ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/hint_mapping.lua")

CUR_INDEX = -1
SLOT_DATA = nil
PLAYER_NUMBER = -1
TEAM_NUMBER = -1
LOCAL_ITEMS = {}
GLOBAL_ITEMS = {}
RECOVER_HIGHLIGHT = {}

if Highlight then
	HINT_STATUS_MAPPING = {
		[20] = Highlight.Avoid,
		[40] = Highlight.None,
		[10] = Highlight.NoPriority,
		[0] = Highlight.Unspecified,
		[30] = Highlight.Priority,
	}
end

function onClear(slot_data)
    PLAYER_NUMBER = Archipelago.PlayerNumber
	TEAM_NUMBER = Archipelago.TeamNumber

	-- use bulk update to pause logic updates until we are done resetting all items/locations
	Tracker.BulkUpdate = true

    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onClear, slot_data:\n%s", dump_table(slot_data)))
    end

    SLOT_DATA = slot_data
    CUR_INDEX = -1

    -- reset locations
    for _, v in pairs(LOCATION_MAPPING) do
        if v[1] then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: clearing location %s", v[1]))
            end
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[1]:sub(1, 1) == "@" then
                    obj.AvailableChestCount = obj.ChestCount

                    if obj.Highlight then
                        obj.Highlight = Highlight.None
                    end
                else
                    obj.Active = false
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: could not find object for code %s", v[1]))
            end
        end
    end

    -- reset items
    for _, v in pairs(ITEM_MAPPING) do
        if v[1] and v[2] then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: clearing item %s of type %s", v[1], v[2]))
            end
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[2] == "toggle" then
                    obj.Active = false
                elseif v[2] == "progressive" then
                    obj.CurrentStage = 0
                    obj.Active = false
                elseif v[2] == "consumable" then
                    obj.AcquiredCount = 0
                elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("onClear: unknown item type %s for code %s", v[2], v[1]))
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: could not find object for code %s", v[1]))
            end
        end
    end

    -- set settings

    -- get hints
    if Archipelago.PlayerNumber > -1 then
        HINTS_ID = "_read_hints_"..TEAM_NUMBER.."_"..PLAYER_NUMBER

        Archipelago:SetNotify({HINTS_ID})
        Archipelago:Get({HINTS_ID})
    end

    -- end clear
	LOCAL_ITEMS = {}
	GLOBAL_ITEMS = {}
	Tracker.BulkUpdate = false

    if SLOT_DATA == nil then
        return
    end
end

function onLocation(location_id, location_name)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onLocation: %s, %s", location_id, location_name))
    end

    local v = LOCATION_MAPPING[location_id]

    if not v and AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onLocation: could not find location mapping for id %s", location_id))
    end

    if not v[1] then
        return
    end

    local obj = Tracker:FindObjectForCode(v[1])

    if obj then
        if v[1]:sub(1, 1) == "@" then
            obj.AvailableChestCount = obj.AvailableChestCount - 1
        else
            obj.Active = true
        end
    elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onLocation: could not find object for code %s", v[1]))
    end
end

function onNotify(key, value, old_value)
    if value ~= old_value and key == HINTS_ID then
        for _, hint in ipairs(value) do
            if hint.finding_player == Archipelago.PlayerNumber then
                UpdateHintsLocation(hint)
                UpdateHintsHighlight(hint)
            end
        end
    end
end

function onNotifyLaunch(key, value)
    if key == HINTS_ID then
        for _, hint in ipairs(value) do
            if hint.finding_player == Archipelago.PlayerNumber then
                UpdateHintsLocation(hint)
                UpdateHintsHighlight(hint)
            end
        end
    end
end

function UpdateHintsHighlight(hint)
    if PopVersion < "0.32.0" then
        return
    end

    table.insert(RECOVER_HIGHLIGHT, hint)
    local objItem = Tracker:FindObjectForCode("highlight_hint")
    if objItem then
        if not objItem.Active then
            return
        end
    end

    -- get the highlight enum value for the hint status
    local item_flags = hint.item_flags
    local hint_status = hint.status
    local highlight_code = nil

    if hint.found then
        highlight_code = Highlight.None
    elseif item_flags == 0 then
        highlight_code = Highlight.Unspecified
    elseif item_flags == 1 then
        highlight_code = Highlight.Priority
    elseif item_flags == 2 then
        highlight_code = Highlight.NoPriority
    elseif hint_status then
        highlight_code = HINT_STATUS_MAPPING[hint_status]
    end

    if not highlight_code then
        -- try to "recover" by checking hint.found (older AP versions without hint.status)
        if hint.found then
            highlight_code = Highlight.None
        elseif not hint.found then
            highlight_code = Highlight.Unspecified
        else
            return
        end
    end

    -- get the location mapping for the location id
    local mapping_entry = LOCATION_MAPPING[hint.location]

    if not mapping_entry then

        if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("updateHint: could not find location mapping for id %s", hint.location))
        end

        return
    end

    for _, location_code in pairs(mapping_entry) do
        if location_code and location_code:sub(1, 1) == "@" then
            local obj = Tracker:FindObjectForCode(location_code)

            if obj and obj.Highlight then
                obj.Highlight = highlight_code
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING then
                print(string.format("updateHint: could update section %s (obj doesn't support Highlight)", location_code))
            end
        end
    end
end

function UpdateHintsLocation(hint)
    local hint_name = Archipelago:GetItemName(hint.item, Archipelago:GetPlayerGame(hint.receiving_player))
    local hint_player = Archipelago:GetPlayerGame(hint.receiving_player)

    local v = HINT_MAPPING[hint.location]
    if v then
        local obj = Tracker:FindObjectForCode(v[1])

        if obj then
            obj.Active = not hint.found
        elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("No object found for code: %s", v[1]))
        end
    end
end

function onItem(index, item_id, item_name, player_number)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onItem: %s, %s, %s, %s, %s", index, item_id, item_name, player_number, CUR_INDEX))
    end

    if index <= CUR_INDEX then
        return
    end

    local is_local = player_number == Archipelago.PlayerNumber
    CUR_INDEX = index;
    local v = ITEM_MAPPING[item_id]

    if not v then
        if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: could not find item mapping for id %s", item_id))
        end
        return
    end

    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onItem: code: %s, type %s", v[1], v[2]))
    end

    if not v[1] then
        return
    end

    local obj = Tracker:FindObjectForCode(v[1])

    if obj then
        if v[2] == "toggle" then
            obj.Active = true
        elseif v[2] == "progressive" then
            if obj.Active then
                obj.CurrentStage = obj.CurrentStage + 1
            else
                obj.Active = true
            end
        elseif v[2] == "consumable" then
            obj.AcquiredCount = obj.AcquiredCount + obj.Increment
        elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: unknown item type %s for code %s", v[2], v[1]))
        end

        if v[1]:match("_set$") then
            local lootSet = v[1]:gsub("%_set", "")
            for i = 1, 8 do
                Tracker:FindObjectForCode(string.format("%s%s", lootSet, i)).Active = true
            end
        elseif v[1]:match("_upgrade$") then
            local upgradeSet = v[1]:gsub("%_upgrade", "")
            Tracker:FindObjectForCode(string.format("%s%s", upgradeSet, "_primary")).Active = true
            Tracker:FindObjectForCode(string.format("%s%s", upgradeSet, "_secondary")).Active = true
            Tracker:FindObjectForCode(string.format("%s%s", upgradeSet, "_special")).Active = true
            Tracker:FindObjectForCode(string.format("%s%s", upgradeSet, "_defensive")).Active = true
        elseif v[1]:match("^victory_") then
            print("bite")
            local victoryName = v[1]:gsub("victory_", "")
            print(victoryName)
            local objVictory = Tracker:FindObjectForCode(victoryName)

            if objVictory then
                objVictory.Active = true
                objVictory.CurrentStage = 2
            end
        end

    elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onItem: could not find object for code %s", v[1]))
    end
end

function onHighlightChange()
    local objItem = Tracker:FindObjectForCode("highlight_hint")

    if objItem then
        if not objItem.Active then
            for _, v in pairs(LOCATION_MAPPING) do
                local obj = Tracker:FindObjectForCode(v[1])

                if obj and obj.Highlight then
                    obj.Highlight = Highlight.None
                end
            end
        else
            local safeRecovery = {}

            for k, v in pairs(RECOVER_HIGHLIGHT) do
                safeRecovery[k] = v
                RECOVER_HIGHLIGHT[k] = nil
            end

            for _, hint in pairs(safeRecovery) do
                UpdateHintsHighlight(hint)
            end
        end
    end
end


-- add AP callbacks
-- un-/comment as needed
Archipelago:AddClearHandler("clear handler", onClear)

if AUTOTRACKER_ENABLE_ITEM_TRACKING then
	Archipelago:AddItemHandler("item handler", onItem)
end

if AUTOTRACKER_ENABLE_LOCATION_TRACKING then
	Archipelago:AddLocationHandler("location handler", onLocation)
end

Archipelago:AddSetReplyHandler("notify handler", onNotify)
Archipelago:AddRetrievedHandler("notify launch handler", onNotifyLaunch)

ScriptHost:AddWatchForCode("useApLayout", "highlight_hint", onHighlightChange)