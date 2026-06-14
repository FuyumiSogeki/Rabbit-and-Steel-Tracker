---@diagnostic disable: lowercase-global
function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    amount = tonumber(amount)
    if not amount then
        return count > 0
    else
        return count >= amount
    end
end

TABLE_PART = {
    ["arsenal"] = "kingdom",
    ["scholar"] = "kingdom",
    ["darkhouse"] = "kingdom",
    ["lakeside"] = "kingdom",
    ["churchmouse"] = "kingdom",
    ["palekeep"] = "kingdom",
    ["moonlit"] = "kingdom",
    ["depths"] = "extra",
    ["atelier"] = "extra",
    ["sanctum"] = "extra",
    ["looping"] = "extra",
    ["pool"] = "extra",
}


TABLE_ORDER = {}

function makeOrder()
    TABLE_ORDER["op_OKA"] = {["region"] = "kingdom", ["sanity"] = "arsenal", ["name"] = "op_OKA", ["order"] = Tracker:ProviderCountForCode("op_OKA")}
    TABLE_ORDER["op_OSN"] = {["region"] = "kingdom", ["sanity"] = "scholar", ["name"] = "op_OSN", ["order"] = Tracker:ProviderCountForCode("op_OSN")}
    TABLE_ORDER["op_ORD"] = {["region"] = "kingdom", ["sanity"] = "darkhouse", ["name"] = "op_ORD", ["order"] = Tracker:ProviderCountForCode("op_ORD")}
    TABLE_ORDER["op_OEL"] = {["region"] = "kingdom", ["sanity"] = "lakeside", ["name"] = "op_OEL", ["order"] = Tracker:ProviderCountForCode("op_OEL")}
    TABLE_ORDER["op_OCS"] = {["region"] = "kingdom", ["sanity"] = "churchmouse", ["name"] = "op_OCS", ["order"] = Tracker:ProviderCountForCode("op_OCS")}
    TABLE_ORDER["op_ODD"] = {["region"] = "extra", ["sanity"] = "depths", ["name"] = "op_ODD", ["order"] = Tracker:ProviderCountForCode("op_ODD")}
    TABLE_ORDER["op_OAA"] = {["region"] = "extra", ["sanity"] = "atelier", ["name"] = "op_OAA", ["order"] = Tracker:ProviderCountForCode("op_OAA")}
    TABLE_ORDER["op_OSS"] = {["region"] = "extra", ["sanity"] = "sanctum", ["name"] = "op_OSS", ["order"] = Tracker:ProviderCountForCode("op_OSS")}
    TABLE_ORDER["op_OPK"] = {["region"] = "kingdom", ["sanity"] = "palekeep", ["name"] = "op_OPK", ["order"] = Tracker:ProviderCountForCode("op_OPK")}
    TABLE_ORDER["op_OLH"] = {["region"] = "extra", ["sanity"] = "looping", ["name"] = "op_OLH", ["order"] = Tracker:ProviderCountForCode("op_OLH")}
    TABLE_ORDER["op_OMP"] = {["region"] = "kingdom", ["sanity"] = "moonlit", ["name"] = "op_OMP", ["order"] = Tracker:ProviderCountForCode("op_OMP")}
    TABLE_ORDER["op_ORP"] = {["region"] = "extra", ["sanity"] = "pool", ["name"] = "op_ORP", ["order"] = Tracker:ProviderCountForCode("op_ORP")}
end

function find(value, region)
    makeOrder()
    local foundElements = {}

    for k, v in pairs(TABLE_ORDER) do
        if v["order"] == value and (has("chaotic_mode") or v["region"] == region) then
            foundElements[k] = v
        end
    end

    return foundElements
end

function findNoRegion(value)
    makeOrder()
    local foundElements = {}

    for k, v in pairs(TABLE_ORDER) do
        if v["order"] == value then
            foundElements[k] = v
        end
    end

    return foundElements
end

function hasEnoughProgRegion(regionChecked)
    local order = Tracker:ProviderCountForCode(regionChecked)
    local count = Tracker:ProviderCountForCode("progressive_area_shira")
    return count >= order
end

function canReachFirst()
    local firstRegions = findNoRegion(1)

    for _, v in pairs(firstRegions) do
        if has(v["sanity"]) then
            return true
        end
    end

    return false
end

function canReachAny()
    local count = 0

    if has("arsenal") and canStartKingdom() and isKingdom() then count = count + 1 end
    if has("scholar") and canStartKingdom() and isKingdom() then count = count + 1 end
    if has("darkhouse") and canStartKingdom() and isKingdom() then count = count + 1 end
    if has("lakeside") and canStartKingdom() and isKingdom() then count = count + 1 end
    if has("churchmouse") and canStartKingdom() and isKingdom() then count = count + 1 end
    if has("depths") and canStartExtra() and isExtra() then count = count + 1 end
    if has("atelier") and canStartExtra() and isExtra() then count = count + 1 end
    if has("sanctum") and canStartExtra() and isExtra() then count = count + 1 end

    return count >= 1
end

function canReachRegionOrder(regionChecked, reg, prog)
    local regionCheckedOrder = Tracker:ProviderCountForCode(regionChecked)
    local regionType = TABLE_ORDER[regionChecked]["region"]

    for i = 1, regionCheckedOrder, 1 do
        local foundRegions

        if not has("chaotic_mode") then
            foundRegions = find(i, regionType)
        else
            foundRegions = find(i)
        end

        local isOk = false

        for _, v in pairs(foundRegions) do
            local isSanityOk = has(v["sanity"]) or not reg
            local isProgOk = hasEnoughProgRegion(v["name"]) or not prog

            isOk = isSanityOk and isProgOk

            if isOk then
                break
            end
        end

        if not isOk then
            return false
        end
    end

    return true
end

function canReachPaleKeep()
    local order = Tracker:ProviderCountForCode("op_OPK")
    local count = 1

    if has("arsenal") then count = count + 1 end
    if has("scholar") then count = count + 1 end
    if has("darkhouse") then count = count + 1 end
    if has("lakeside") then count = count + 1 end
    if has("churchmouse") then count = count + 1 end
    if has("depths") then count = count + 1 end
    if has("atelier") then count = count + 1 end
    if has("sanctum") then count = count + 1 end

    return count >= order
end

function canReachPinnacle()
    local order = Tracker:ProviderCountForCode("op_OMP")
    local count = 2

    if has("arsenal") then count = count + 1 end
    if has("scholar") then count = count + 1 end
    if has("darkhouse") then count = count + 1 end
    if has("lakeside") then count = count + 1 end
    if has("churchmouse") then count = count + 1 end
    if has("depths") then count = count + 1 end
    if has("atelier") then count = count + 1 end
    if has("sanctum") then count = count + 1 end

    return count >= order and has("palekeep")
end

function canReachHallway()
    local order = Tracker:ProviderCountForCode("op_OLH")
    local count = 1

    if has("arsenal") then count = count + 1 end
    if has("scholar") then count = count + 1 end
    if has("darkhouse") then count = count + 1 end
    if has("lakeside") then count = count + 1 end
    if has("churchmouse") then count = count + 1 end
    if has("depths") then count = count + 1 end
    if has("atelier") then count = count + 1 end
    if has("sanctum") then count = count + 1 end

    return count >= order
end

function canReachPool()
    local order = Tracker:ProviderCountForCode("op_ORP")
    local count = 2

    if has("arsenal") then count = count + 1 end
    if has("scholar") then count = count + 1 end
    if has("darkhouse") then count = count + 1 end
    if has("lakeside") then count = count + 1 end
    if has("churchmouse") then count = count + 1 end
    if has("depths") then count = count + 1 end
    if has("atelier") then count = count + 1 end
    if has("sanctum") then count = count + 1 end

    return count >= order and has("looping")
end

-- Hint Settings
function isHint()
    return has("scout_hint")
end

-- Logic Settings
function isCheckChest()
    return has("item_chest_on")
end

function isShopGlobal()
    return has("shop_sanity_global")
end

function isShopRegion()
    return has("shop_sanity_region")
end

function isClassSanity()
    return has("class_sanity_on")
end

function isProgressiveRegion()
    return has("progressive_region_on")
end

function isKingdomSanity()
    return has("kingdom_sanity_on")
end

function isKingdomOrder()
    return has("kingdom_order_on")
end

function isKingdom()
    return not has("extra_mode")
end

function isExtra()
    return not has("kingdom_mode")
end

-- Visibility region
function isKingArsenal()
    return not has("KA_excluded") and isKingdom()
end

function isScholarNest()
    return not has("SN_excluded") and isKingdom()
end

function isRedDarkhouse()
    return not has("RD_excluded") and isKingdom()
end

function isEmeraldLakeside()
    return not has("EL_excluded") and isKingdom()
end

function isChurchmouseStreets()
    return not has("CS_excluded") and isKingdom()
end

function isPaleKeep()
    return not has("PK_excluded") and isKingdom()
end

function isMoonlitPinnacle()
    return not has("MP_excluded") and isKingdom()
end

function isDarkhouseDepths()
    return not has("DD_excluded") and isExtra()
end

function isAtelierAurum()
    return not has("AA_excluded") and isExtra()
end

function isSubterraSanctum()
    return not has("SS_excluded") and isExtra()
end

function isLoopingHallway()
    return not has("LH_excluded") and isExtra()
end

function isReflectingPool()
    return not has("RP_excluded") and isExtra()
end

-- Visibility class
function isAncient()
    return has("ancient_checks")
end

function isAssassin()
    return has("assassin_checks")
end

function isBruiser()
    return has("bruiser_checks")
end

function isDancer()
    return has("dancer_checks")
end

function isDefender()
    return has("defender_checks")
end

function isDruid()
    return has("druid_checks")
end

function isHeavyblade()
    return has("heavyblade_checks")
end

function isSniper()
    return has("sniper_checks")
end

function isSpellsword()
    return has("spellsword_checks")
end

function isWizard()
    return has("wizard_checks")
end

function isHammermaid()
    return has("hammermaid_checks")
end

function isPyromancer()
    return has("pyromancer_checks")
end

function isGrenadier()
    return has("grenadier_checks")
end

function isShadow()
    return has("shadow_checks")
end

function RegionSanityProgOrder()
    return isKingdomSanity() and isProgressiveRegion() and isKingdomOrder()
end

function RegionSanityProg()
    return isKingdomSanity() and isProgressiveRegion() and not isKingdomOrder()
end

function RegionSanityOrder()
    return isKingdomSanity() and not isProgressiveRegion() and isKingdomOrder()
end

function RegionSanity()
    return isKingdomSanity() and not isProgressiveRegion() and not isKingdomOrder()
end

function RegionProgOrder()
    return not isKingdomSanity() and isProgressiveRegion() and isKingdomOrder()
end

function RegionProg()
    return not isKingdomSanity() and isProgressiveRegion() and not isKingdomOrder()
end

function RegionOrder()
    return not isKingdomSanity() and not isProgressiveRegion() and isKingdomOrder()
end

function RegionNothing()
    return not isKingdomSanity() and not isProgressiveRegion() and not isKingdomOrder()
end

-- Region Logic
function canOutskirts()
    return has("outskirts") or not isKingdomSanity()
end

function canStartKingdom()
    return canOutskirts() or not has("either_mode")
end

function canGeode()
    return has("geode") or not isKingdomSanity()
end

function canStartExtra()
    return canGeode() or not has("either_mode")
end

function canKingArsenal()
    if RegionSanityProgOrder() then return has("arsenal") and canReachRegionOrder("op_OKA", true, true) and canStartKingdom()
    elseif RegionSanityOrder() then return has("arsenal") and canReachRegionOrder("op_OKA", true, false) and canStartKingdom()
    elseif RegionSanityProg() then  return has("arsenal") and has("progressive_area_shira", 1) and canStartKingdom()
    elseif RegionSanity() then      return has("arsenal") and canStartKingdom()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OKA", false, true) and canStartKingdom()
    elseif RegionProg() then        return has("progressive_area_shira", 1) and canStartKingdom()
    elseif RegionOrder() then       return true and canStartKingdom()
    elseif RegionNothing() then     return true and canStartKingdom()
    else                            return false and canStartKingdom()
    end
end

function canScholarNest()
    if RegionSanityProgOrder() then return has("scholar") and canReachRegionOrder("op_OSN", true, true) and canStartKingdom()
    elseif RegionSanityOrder() then return has("scholar") and canReachRegionOrder("op_OSN", true, false) and canStartKingdom()
    elseif RegionSanityProg() then  return has("scholar") and has("progressive_area_shira", 1) and canStartKingdom()
    elseif RegionSanity() then      return has("scholar") and canStartKingdom()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OSN", false, true) and canStartKingdom()
    elseif RegionProg() then        return has("progressive_area_shira", 1) and canStartKingdom()
    elseif RegionOrder() then       return true and canStartKingdom()
    elseif RegionNothing() then     return true and canStartKingdom()
    else                            return false and canStartKingdom()
    end
end

function canRedDarkhouse()
    if RegionSanityProgOrder() then return has("darkhouse") and canReachRegionOrder("op_ORD", true, true) and canStartKingdom()
    elseif RegionSanityOrder() then return has("darkhouse") and canReachRegionOrder("op_ORD", true, false) and canStartKingdom()
    elseif RegionSanityProg() then  return has("darkhouse") and has("progressive_area_shira", 1) and canStartKingdom()
    elseif RegionSanity() then      return has("darkhouse") and canStartKingdom()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_ORD", false, true) and canStartKingdom()
    elseif RegionProg() then        return has("progressive_area_shira", 1) and canStartKingdom()
    elseif RegionOrder() then       return true and canStartKingdom()
    elseif RegionNothing() then     return true and canStartKingdom()
    else                            return false and canStartKingdom()
    end
end

function canChurchmouseStreets()
    if RegionSanityProgOrder() then return has("churchmouse") and canReachRegionOrder("op_OCS", true, true) and canStartKingdom()
    elseif RegionSanityOrder() then return has("churchmouse") and canReachRegionOrder("op_OCS", true, false) and canStartKingdom()
    elseif RegionSanityProg() then  return has("churchmouse") and has("progressive_area_shira", 1) and canStartKingdom()
    elseif RegionSanity() then      return has("churchmouse") and canStartKingdom()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OCS", false, true) and canStartKingdom()
    elseif RegionProg() then        return has("progressive_area_shira", 1) and canStartKingdom()
    elseif RegionOrder() then       return true and canStartKingdom()
    elseif RegionNothing() then     return true and canStartKingdom()
    else                            return false and canStartKingdom()
    end
end

function canEmeraldLakeside()
    if RegionSanityProgOrder() then return has("lakeside") and canReachRegionOrder("op_OEL", true, true) and canStartKingdom()
    elseif RegionSanityOrder() then return has("lakeside") and canReachRegionOrder("op_OEL", true, false) and canStartKingdom()
    elseif RegionSanityProg() then  return has("lakeside") and has("progressive_area_shira", 1) and canStartKingdom()
    elseif RegionSanity() then      return has("lakeside") and canStartKingdom()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OEL", false, true) and canStartKingdom()
    elseif RegionProg() then        return has("progressive_area_shira", 1) and canStartKingdom()
    elseif RegionOrder() then       return true and canStartKingdom()
    elseif RegionNothing() then     return true and canStartKingdom()
    else                            return false and canStartKingdom()
    end
end

function canPaleKeep()
    if RegionSanityProgOrder() then return has("palekeep") and canReachRegionOrder("op_OPK", true, true) and canStartKingdom()
    elseif RegionSanityOrder() then return has("palekeep") and canReachRegionOrder("op_OPK", true, false) and canStartKingdom()
    elseif RegionSanityProg() then  return has("palekeep") and canReachPaleKeep() and hasEnoughProgRegion("op_OPK") and canStartKingdom()
    elseif RegionSanity() then      return has("palekeep") and canReachPaleKeep() and canStartKingdom()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OPK", false, true) and canStartKingdom()
    elseif RegionProg() then        return hasEnoughProgRegion("op_OPK") and canStartKingdom()
    elseif RegionOrder() then       return true and canStartKingdom()
    elseif RegionNothing() then     return true and canStartKingdom()
    else                            return false and canStartKingdom()
    end
end

function canMoonlitPinnacle()
    if RegionSanityProgOrder() then return has("moonlit") and canReachRegionOrder("op_OMP", true, true) and canStartKingdom()
    elseif RegionSanityOrder() then return has("moonlit") and canReachRegionOrder("op_OMP", true, false) and canStartKingdom()
    elseif RegionSanityProg() then  return has("moonlit") and canReachPinnacle() and hasEnoughProgRegion("op_OMP") and canStartKingdom()
    elseif RegionSanity() then      return has("moonlit") and canReachPinnacle() and canStartKingdom()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OMP", false, true) and canStartKingdom()
    elseif RegionProg() then        return hasEnoughProgRegion("op_OMP") and canStartKingdom()
    elseif RegionOrder() then       return true and canStartKingdom()
    elseif RegionNothing() then     return true and canStartKingdom()
    else                            return false and canStartKingdom()
    end
end


function canDarkhouseDepths()
    if RegionSanityProgOrder() then return has("depths") and canReachRegionOrder("op_ODD", true, true) and canStartExtra()
    elseif RegionSanityOrder() then return has("depths") and canReachRegionOrder("op_ODD", true, false) and canStartExtra()
    elseif RegionSanityProg() then  return has("depths") and has("progressive_area_shira", 1) and canStartExtra()
    elseif RegionSanity() then      return has("depths") and canStartExtra()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_ODD", false, true) and canStartExtra()
    elseif RegionProg() then        return has("progressive_area_shira", 1) and canStartExtra()
    elseif RegionOrder() then       return true and canStartExtra()
    elseif RegionNothing() then     return true and canStartExtra()
    else                            return false and canStartExtra()
    end
end

function canAtelierAurum()
    if RegionSanityProgOrder() then return has("atelier") and canReachRegionOrder("op_OAA", true, true) and canStartExtra()
    elseif RegionSanityOrder() then return has("atelier") and canReachRegionOrder("op_OAA", true, false) and canStartExtra()
    elseif RegionSanityProg() then  return has("atelier") and has("progressive_area_shira", 1) and canStartExtra()
    elseif RegionSanity() then      return has("atelier") and canStartExtra()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OAA", false, true) and canStartExtra()
    elseif RegionProg() then        return has("progressive_area_shira", 1) and canStartExtra()
    elseif RegionOrder() then       return true and canStartExtra()
    elseif RegionNothing() then     return true and canStartExtra()
    else                            return false and canStartExtra()
    end
end

function canSubterraSanctum()
    if RegionSanityProgOrder() then return has("sanctum") and canReachRegionOrder("op_OSS", true, true) and canStartExtra()
    elseif RegionSanityOrder() then return has("sanctum") and canReachRegionOrder("op_OSS", true, false) and canStartExtra()
    elseif RegionSanityProg() then  return has("sanctum") and has("progressive_area_shira", 1) and canStartExtra()
    elseif RegionSanity() then      return has("sanctum") and canStartExtra()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OSS", false, true) and canStartExtra()
    elseif RegionProg() then        return has("progressive_area_shira", 1) and canStartExtra()
    elseif RegionOrder() then       return true and canStartExtra()
    elseif RegionNothing() then     return true and canStartExtra()
    else                            return false and canStartExtra()
    end
end

function canLoopingHallway()
    if RegionSanityProgOrder() then return has("looping") and canReachRegionOrder("op_OLH", true, true) and canStartExtra()
    elseif RegionSanityOrder() then return has("looping") and canReachRegionOrder("op_OLH", true, false) and canStartExtra()
    elseif RegionSanityProg() then  return has("looping") and canReachHallway() and hasEnoughProgRegion("op_OLH") and canStartExtra()
    elseif RegionSanity() then      return has("looping") and canReachHallway() and canStartExtra()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OLH", false, true) and canStartExtra()
    elseif RegionProg() then        return hasEnoughProgRegion("op_OLH") and canStartExtra()
    elseif RegionOrder() then       return true and canStartExtra()
    elseif RegionNothing() then     return true and canStartExtra()
    else                            return false and canStartExtra()
    end
end

function canReflectingPool()
    if RegionSanityProgOrder() then return has("pool") and canReachRegionOrder("op_ORP", true, true) and canStartExtra()
    elseif RegionSanityOrder() then return has("pool") and canReachRegionOrder("op_ORP", true, false) and canStartExtra()
    elseif RegionSanityProg() then  return has("pool") and canReachPool() and hasEnoughProgRegion("op_ORP") and canStartExtra()
    elseif RegionSanity() then      return has("pool") and canReachPool() and canStartExtra()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_ORP", false, true) and canStartExtra()
    elseif RegionProg() then        return hasEnoughProgRegion("op_ORP") and canStartExtra()
    elseif RegionOrder() then       return true and canStartExtra()
    elseif RegionNothing() then     return true and canStartExtra()
    else                            return false and canStartExtra()
    end
end

-- Class Logic
function canWizard()
    if isClassSanity() then return has("wizard")
    else                    return true
    end
end

function canAssassin()
    if isClassSanity() then return has("assassin")
    else                    return true
    end
end

function canHeavyblade()
    if isClassSanity() then return has("heavyblade")
    else                    return true
    end
end

function canDancer()
    if isClassSanity() then return has("dancer")
    else                    return true
    end
end

function canDruid()
    if isClassSanity() then return has("druid")
    else                    return true
    end
end

function canSpellsword()
    if isClassSanity() then return has("spellsword")
    else                    return true
    end
end

function canSniper()
    if isClassSanity() then return has("sniper")
    else                    return true
    end
end

function canBruiser()
    if isClassSanity() then return has("bruiser")
    else                    return true
    end
end

function canDefender()
    if isClassSanity() then return has("defender")
    else                    return true
    end
end

function canAncient()
    if isClassSanity() then return has("ancient")
    else                    return true
    end
end

function canHammermaid()
    if isClassSanity() then return has("hammermaid")
    else                    return true
    end
end

function canPyromancer()
    if isClassSanity() then return has("pyromancer")
    else                    return true
    end
end

function canGrenadier()
    if isClassSanity() then return has("grenadier")
    else                    return true
    end
end

function canShadow()
    if isClassSanity() then return has("shadow")
    else                    return true
    end
end

-- Shop logic
function canShopAny()
    if RegionSanityProgOrder() then return canReachFirst() and has("progressive_area_shira", 1)
    elseif RegionSanityOrder() then return canReachFirst()
    elseif RegionSanityProg() then  return canReachAny() and has("progressive_area_shira", 1)
    elseif RegionSanity() then      return canReachAny()
    elseif RegionProgOrder() then   return has("progressive_area_shira", 1)
    elseif RegionProg() then        return has("progressive_area_shira", 1)
    elseif RegionOrder() then       return true
    elseif RegionNothing() then     return true
    else                            return false
    end
end

function canShopKingArsenal()
    return canKingArsenal()
end

function canShopScholarNest()
    return canScholarNest()
end

function canShopRedDarkhouse()
    return canRedDarkhouse()
end

function canShopEmeraldLakeside()
    return canEmeraldLakeside()
end

function canShopChurchmouseStreets()
    return canChurchmouseStreets()
end

function canShopPaleKeep()
    return canPaleKeep()
end

function canShopDarkhouseDepths()
    return canDarkhouseDepths()
end

function canShopAtelierAurum()
    return canAtelierAurum()
end

function canShopSubterraSanctum()
    return canSubterraSanctum()
end

function canShopLoopingHallway()
    return canLoopingHallway()
end

-- Treasuresphere logic
function canTreasureKingArsenal()
    return canKingArsenal()
end

function canTreasureScholarNest()
    return canScholarNest()
end

function canTreasureRedDarkhouse()
    return canRedDarkhouse()
end

function canTreasureEmeraldLakeside()
    return canEmeraldLakeside()
end

function canTreasureChurchmouseStreets()
    return canChurchmouseStreets()
end

function canTreasurePaleKeep()
    return canPaleKeep()
end

function canTreasureDarkhouseDepths()
    return canDarkhouseDepths()
end

function canTreasureAtelierAurum()
    return canAtelierAurum()
end

function canTreasureSubterraSanctum()
    return canSubterraSanctum()
end

function canTreasureLoopingHallway()
    return canLoopingHallway()
end
