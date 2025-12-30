-- entry point for all lua code of the pack
-- more info on the lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
ENABLE_DEBUG_LOG = true
-- get current variant
local variant = Tracker.ActiveVariantUID

-- Utility Script for helper functions etc.
ScriptHost:LoadScript("scripts/utils.lua")

--Scripts
ScriptHost:LoadScript("scripts/logic.lua")

-- Items
Tracker:AddItems("items/items.jsonc")
Tracker:AddItems("items/hints.jsonc")
Tracker:AddItems("items/common_pop.jsonc")

-- Maps
Tracker:AddMaps("maps/maps.jsonc")

-- Layouts
Tracker:AddLayouts("layouts/items.jsonc")
Tracker:AddLayouts("layouts/tracker.jsonc")
Tracker:AddLayouts("layouts/setting_popup.jsonc")

-- Locations
Tracker:AddLocations("locations/shop.jsonc")
Tracker:AddLocations("locations/outskirts.jsonc")
Tracker:AddLocations("locations/kingArsenal.jsonc")
Tracker:AddLocations("locations/scholarNest.jsonc")
Tracker:AddLocations("locations/redDarkhouse.jsonc")
Tracker:AddLocations("locations/churchmouseStreets.jsonc")
Tracker:AddLocations("locations/emeraldLakeside.jsonc")
Tracker:AddLocations("locations/paleKeep.jsonc")
Tracker:AddLocations("locations/moonlitPinnacle.jsonc")
Tracker:AddLocations("locations/class.jsonc")
Tracker:AddLocations("locations/kingdom.jsonc")
Tracker:AddLocations("locations/treasure.jsonc")

print("-- Example Tracker --")
print("Loaded variant: ", variant)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
