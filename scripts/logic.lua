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

function hasEnoughProgRegion(regionChecked)
    local order = Tracker:ProviderCountForCode(regionChecked)
    local count = Tracker:ProviderCountForCode("progressive_area")
    return count >= order
end

function canReachFirst()
    if has("arsenal") and Tracker:ProviderCountForCode("op_OKA") == 1 and Tracker:ProviderCountForCode("progressive_area") >= 1 then
        return true
    elseif has("scholar") and Tracker:ProviderCountForCode("op_OSN") == 1 and Tracker:ProviderCountForCode("progressive_area") >= 1 then
        return true
    elseif has("darkhouse") and Tracker:ProviderCountForCode("op_ORD") == 1 and Tracker:ProviderCountForCode("progressive_area") >= 1 then
        return true
    elseif has("lakeside") and Tracker:ProviderCountForCode("op_OEL") == 1 and Tracker:ProviderCountForCode("progressive_area") >= 1 then
        return true
    elseif has("churchmouse") and Tracker:ProviderCountForCode("op_OCS") == 1 and Tracker:ProviderCountForCode("progressive_area") >= 1 then
        return true
    else
        return false
    end
end

function canReachAny()
    local count = 0

    if has("arsenal") then count = count + 1 end
    if has("scholar") then count = count + 1 end
    if has("darkhouse") then count = count + 1 end
    if has("lakeside") then count = count + 1 end
    if has("churchmouse") then count = count + 1 end

    return count >= 1
end

function canReachRegionOrder(regionChecked, reg, prog)
    local regionCheckedOrder = Tracker:ProviderCountForCode(regionChecked)
    local regionReachCount = 0

    print(string.format("region order: %s - reach count: %s", regionCheckedOrder, regionReachCount))

    if regionCheckedOrder > 0 then
        if prog and Tracker:ProviderCountForCode("progressive_area") < regionCheckedOrder then
            return false
        end

        regionReachCount = regionReachCount + 1

        if regionCheckedOrder > 1 then
                if Tracker:ProviderCountForCode("op_OKA") == 1 and ((reg and has("arsenal")) or not reg) and ((prog and hasEnoughProgRegion("op_OKA")) or not prog) then regionReachCount = regionReachCount + 1
            elseif Tracker:ProviderCountForCode("op_OSN") == 1 and ((reg and has("scholar")) or not reg) and ((prog and hasEnoughProgRegion("op_OSN")) or not prog) then regionReachCount = regionReachCount + 1
            elseif Tracker:ProviderCountForCode("op_ORD") == 1 and ((reg and has("darkhouse")) or not reg) and ((prog and hasEnoughProgRegion("op_ORD")) or not prog) then regionReachCount = regionReachCount + 1
            elseif Tracker:ProviderCountForCode("op_OEL") == 1 and ((reg and has("lakeside")) or not reg) and ((prog and hasEnoughProgRegion("op_OEL")) or not prog) then regionReachCount = regionReachCount + 1
            elseif Tracker:ProviderCountForCode("op_OCS") == 1 and ((reg and has("churchmouse") or not reg)) and ((prog and hasEnoughProgRegion("op_OCS")) or not prog) then regionReachCount = regionReachCount + 1
            elseif Tracker:ProviderCountForCode("op_OPK") == 1 and ((reg and has("palekeep") or not reg)) and ((prog and hasEnoughProgRegion("op_OPK")) or not prog) then regionReachCount = regionReachCount + 1
            elseif Tracker:ProviderCountForCode("op_OMP") == 1 and ((reg and has("moonlit") or not reg)) and ((prog and hasEnoughProgRegion("op_OMP")) or not prog) then regionReachCount = regionReachCount + 1
            end

            if regionCheckedOrder > 2 then
                    if Tracker:ProviderCountForCode("op_OKA") == 2 and ((reg and has("arsenal")) or not reg) and ((prog and hasEnoughProgRegion("op_OKA")) or not prog) then regionReachCount = regionReachCount + 1
                elseif Tracker:ProviderCountForCode("op_OSN") == 2 and ((reg and has("scholar")) or not reg) and ((prog and hasEnoughProgRegion("op_OSN")) or not prog) then regionReachCount = regionReachCount + 1
                elseif Tracker:ProviderCountForCode("op_ORD") == 2 and ((reg and has("darkhouse")) or not reg) and ((prog and hasEnoughProgRegion("op_ORD")) or not prog) then regionReachCount = regionReachCount + 1
                elseif Tracker:ProviderCountForCode("op_OEL") == 2 and ((reg and has("lakeside")) or not reg) and ((prog and hasEnoughProgRegion("op_OEL")) or not prog) then regionReachCount = regionReachCount + 1
                elseif Tracker:ProviderCountForCode("op_OCS") == 2 and ((reg and has("churchmouse") or not reg)) and ((prog and hasEnoughProgRegion("op_OCS")) or not prog) then regionReachCount = regionReachCount + 1
                elseif Tracker:ProviderCountForCode("op_OPK") == 2 and ((reg and has("palekeep") or not reg)) and ((prog and hasEnoughProgRegion("op_OPK")) or not prog) then regionReachCount = regionReachCount + 1
                elseif Tracker:ProviderCountForCode("op_OMP") == 2 and ((reg and has("moonlit") or not reg)) and ((prog and hasEnoughProgRegion("op_OMP")) or not prog) then regionReachCount = regionReachCount + 1
                end

                if regionCheckedOrder > 3 then
                        if Tracker:ProviderCountForCode("op_OKA") == 3 and ((reg and has("arsenal")) or not reg) and ((prog and hasEnoughProgRegion("op_OKA")) or not prog) then regionReachCount = regionReachCount + 1
                    elseif Tracker:ProviderCountForCode("op_OSN") == 3 and ((reg and has("scholar")) or not reg) and ((prog and hasEnoughProgRegion("op_OSN")) or not prog) then regionReachCount = regionReachCount + 1
                    elseif Tracker:ProviderCountForCode("op_ORD") == 3 and ((reg and has("darkhouse")) or not reg) and ((prog and hasEnoughProgRegion("op_ORD")) or not prog) then regionReachCount = regionReachCount + 1
                    elseif Tracker:ProviderCountForCode("op_OEL") == 3 and ((reg and has("lakeside")) or not reg) and ((prog and hasEnoughProgRegion("op_OEL")) or not prog) then regionReachCount = regionReachCount + 1
                    elseif Tracker:ProviderCountForCode("op_OCS") == 3 and ((reg and has("churchmouse") or not reg)) and ((prog and hasEnoughProgRegion("op_OCS")) or not prog) then regionReachCount = regionReachCount + 1
                    elseif Tracker:ProviderCountForCode("op_OPK") == 3 and ((reg and has("palekeep") or not reg)) and ((prog and hasEnoughProgRegion("op_OPK")) or not prog) then regionReachCount = regionReachCount + 1
                    elseif Tracker:ProviderCountForCode("op_OMP") == 3 and ((reg and has("moonlit") or not reg)) and ((prog and hasEnoughProgRegion("op_OMP")) or not prog) then regionReachCount = regionReachCount + 1
                    end

                    if regionCheckedOrder > 4 then
                            if Tracker:ProviderCountForCode("op_OKA") == 4 and ((reg and has("arsenal")) or not reg) and ((prog and hasEnoughProgRegion("op_OKA")) or not prog) then regionReachCount = regionReachCount + 1
                        elseif Tracker:ProviderCountForCode("op_OSN") == 4 and ((reg and has("scholar")) or not reg) and ((prog and hasEnoughProgRegion("op_OSN")) or not prog) then regionReachCount = regionReachCount + 1
                        elseif Tracker:ProviderCountForCode("op_ORD") == 4 and ((reg and has("darkhouse")) or not reg) and ((prog and hasEnoughProgRegion("op_ORD")) or not prog) then regionReachCount = regionReachCount + 1
                        elseif Tracker:ProviderCountForCode("op_OEL") == 4 and ((reg and has("lakeside")) or not reg) and ((prog and hasEnoughProgRegion("op_OEL")) or not prog) then regionReachCount = regionReachCount + 1
                        elseif Tracker:ProviderCountForCode("op_OCS") == 4 and ((reg and has("churchmouse") or not reg)) and ((prog and hasEnoughProgRegion("op_OCS")) or not prog) then regionReachCount = regionReachCount + 1
                        elseif Tracker:ProviderCountForCode("op_OPK") == 4 and ((reg and has("palekeep") or not reg)) and ((prog and hasEnoughProgRegion("op_OPK")) or not prog) then regionReachCount = regionReachCount + 1
                        elseif Tracker:ProviderCountForCode("op_OMP") == 4 and ((reg and has("moonlit") or not reg)) and ((prog and hasEnoughProgRegion("op_OMP")) or not prog) then regionReachCount = regionReachCount + 1
                        end

                        if regionCheckedOrder > 5 then
                                if Tracker:ProviderCountForCode("op_OKA") == 5 and ((reg and has("arsenal")) or not reg) and ((prog and hasEnoughProgRegion("op_OKA")) or not prog) then regionReachCount = regionReachCount + 1
                            elseif Tracker:ProviderCountForCode("op_OSN") == 5 and ((reg and has("scholar")) or not reg) and ((prog and hasEnoughProgRegion("op_OSN")) or not prog) then regionReachCount = regionReachCount + 1
                            elseif Tracker:ProviderCountForCode("op_ORD") == 5 and ((reg and has("darkhouse")) or not reg) and ((prog and hasEnoughProgRegion("op_ORD")) or not prog) then regionReachCount = regionReachCount + 1
                            elseif Tracker:ProviderCountForCode("op_OEL") == 5 and ((reg and has("lakeside")) or not reg) and ((prog and hasEnoughProgRegion("op_OEL")) or not prog) then regionReachCount = regionReachCount + 1
                            elseif Tracker:ProviderCountForCode("op_OCS") == 5 and ((reg and has("churchmouse") or not reg)) and ((prog and hasEnoughProgRegion("op_OCS")) or not prog) then regionReachCount = regionReachCount + 1
                            elseif Tracker:ProviderCountForCode("op_OPK") == 5 and ((reg and has("palekeep") or not reg)) and ((prog and hasEnoughProgRegion("op_OPK")) or not prog) then regionReachCount = regionReachCount + 1
                            elseif Tracker:ProviderCountForCode("op_OMP") == 5 and ((reg and has("moonlit") or not reg)) and ((prog and hasEnoughProgRegion("op_OMP")) or not prog) then regionReachCount = regionReachCount + 1
                            end

                            if regionCheckedOrder > 6 then
                                    if Tracker:ProviderCountForCode("op_OKA") == 6 and ((reg and has("arsenal")) or not reg) and ((prog and hasEnoughProgRegion("op_OKA")) or not prog) then regionReachCount = regionReachCount + 1
                                elseif Tracker:ProviderCountForCode("op_OSN") == 6 and ((reg and has("scholar")) or not reg) and ((prog and hasEnoughProgRegion("op_OSN")) or not prog) then regionReachCount = regionReachCount + 1
                                elseif Tracker:ProviderCountForCode("op_ORD") == 6 and ((reg and has("darkhouse")) or not reg) and ((prog and hasEnoughProgRegion("op_ORD")) or not prog) then regionReachCount = regionReachCount + 1
                                elseif Tracker:ProviderCountForCode("op_OEL") == 6 and ((reg and has("lakeside")) or not reg) and ((prog and hasEnoughProgRegion("op_OEL")) or not prog) then regionReachCount = regionReachCount + 1
                                elseif Tracker:ProviderCountForCode("op_OCS") == 6 and ((reg and has("churchmouse") or not reg)) and ((prog and hasEnoughProgRegion("op_OCS")) or not prog) then regionReachCount = regionReachCount + 1
                                elseif Tracker:ProviderCountForCode("op_OPK") == 6 and ((reg and has("palekeep") or not reg)) and ((prog and hasEnoughProgRegion("op_OPK")) or not prog) then regionReachCount = regionReachCount + 1
                                elseif Tracker:ProviderCountForCode("op_OMP") == 6 and ((reg and has("moonlit") or not reg)) and ((prog and hasEnoughProgRegion("op_OMP")) or not prog) then regionReachCount = regionReachCount + 1
                                end

                                if regionCheckedOrder > 7 then
                                        if Tracker:ProviderCountForCode("op_OKA") == 7 and ((reg and has("arsenal")) or not reg) and ((prog and hasEnoughProgRegion("op_OKA")) or not prog) then regionReachCount = regionReachCount + 1
                                    elseif Tracker:ProviderCountForCode("op_OSN") == 7 and ((reg and has("scholar")) or not reg) and ((prog and hasEnoughProgRegion("op_OSN")) or not prog) then regionReachCount = regionReachCount + 1
                                    elseif Tracker:ProviderCountForCode("op_ORD") == 7 and ((reg and has("darkhouse")) or not reg) and ((prog and hasEnoughProgRegion("op_ORD")) or not prog) then regionReachCount = regionReachCount + 1
                                    elseif Tracker:ProviderCountForCode("op_OEL") == 7 and ((reg and has("lakeside")) or not reg) and ((prog and hasEnoughProgRegion("op_OEL")) or not prog) then regionReachCount = regionReachCount + 1
                                    elseif Tracker:ProviderCountForCode("op_OCS") == 7 and ((reg and has("churchmouse") or not reg)) and ((prog and hasEnoughProgRegion("op_OCS")) or not prog) then regionReachCount = regionReachCount + 1
                                    elseif Tracker:ProviderCountForCode("op_OPK") == 7 and ((reg and has("palekeep") or not reg)) and ((prog and hasEnoughProgRegion("op_OPK")) or not prog) then regionReachCount = regionReachCount + 1
                                    elseif Tracker:ProviderCountForCode("op_OMP") == 7 and ((reg and has("moonlit") or not reg)) and ((prog and hasEnoughProgRegion("op_OMP")) or not prog) then regionReachCount = regionReachCount + 1
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    print(string.format("region order: %s - reach count: %s", regionCheckedOrder, regionReachCount))

    return regionReachCount >= regionCheckedOrder
end

function canReachPaleKeepOrder()
    local order = Tracker:ProviderCountForCode("op_OPK")
    local count = 1

    if Tracker:ProviderCountForCode("op_OKA") == 1 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 1 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 1 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 1 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 1 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 2 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 2 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 2 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 2 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 2 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 3 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 3 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 3 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 3 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 3 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 4 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 4 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 4 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 4 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 4 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 5 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 5 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 5 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 5 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 5 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    end

    return count >= order
end

function canReachPaleKeep()
    local order = Tracker:ProviderCountForCode("op_OPK")
    local count = 1

    if has("arsenal") then count = count + 1 end
    if has("scholar") then count = count + 1 end
    if has("darkhouse") then count = count + 1 end
    if has("lakeside") then count = count + 1 end
    if has("churchmouse") then count = count + 1 end

    return count >= order
end

function canReachPinnacleOrder()
    local order = Tracker:ProviderCountForCode("op_OMP")
    local count = 2

    if Tracker:ProviderCountForCode("op_OKA") == 1 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 1 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 1 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 1 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 1 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 2 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 2 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 2 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 2 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 2 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 3 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 3 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 3 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 3 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 3 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 4 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 4 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 4 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 4 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 4 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 5 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 5 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 5 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 5 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 5 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    end

    return count >= order and has("palekeep")
end

function canReachPinnacle()
    local order = Tracker:ProviderCountForCode("op_OMP")
    local count = 2

    if has("arsenal") then count = count + 1 end
    if has("scholar") then count = count + 1 end
    if has("darkhouse") then count = count + 1 end
    if has("lakeside") then count = count + 1 end
    if has("churchmouse") then count = count + 1 end

    return count >= order and has("palekeep")
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

function isKingArsenal()
    return not has("KA_excluded")
end

function isScholarNest()
    return not has("SN_excluded")
end

function isRedDarkhouse()
    return not has("RD_excluded")
end

function isEmeraldLakeside()
    return not has("EL_excluded")
end

function isChurchmouseStreets()
    return not has("CS_excluded")
end

function isPaleKeep()
    return not has("PK_excluded")
end

function isMoonlitPinnacle()
    return not has("MP_excluded")
end

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

function RegionSanityProgOrder()
    return isKingdomSanity() and isProgressiveRegion() and isKingdomOrder()
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
function canKingArsenal()
    if RegionSanityProgOrder() then return has("arsenal") and canReachRegionOrder("op_OKA", true, true)
    elseif RegionSanityOrder() then return has("arsenal") and canReachRegionOrder("op_OKA", true, false)
    elseif RegionSanity() then      return has("arsenal")
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OKA", false, true)
    elseif RegionProg() then        return has("progressive_area", 1)
    elseif RegionOrder() then       return true
    elseif RegionNothing() then     return true
    else                            return false
    end
end

function canScholarNest()
    if RegionSanityProgOrder() then return has("scholar") and canReachRegionOrder("op_OSN", true, true)
    elseif RegionSanityOrder() then return has("scholar") and canReachRegionOrder("op_OSN", true, false)
    elseif RegionSanity() then      return has("scholar")
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OSN", false, true)
    elseif RegionProg() then        return has("progressive_area", 1)
    elseif RegionOrder() then       return true
    elseif RegionNothing() then     return true
    else                            return false
    end
end

function canRedDarkhouse()
    if RegionSanityProgOrder() then return has("darkhouse") and canReachRegionOrder("op_ORD", true, true)
    elseif RegionSanityOrder() then return has("darkhouse") and canReachRegionOrder("op_ORD", true, false)
    elseif RegionSanity() then      return has("darkhouse")
    elseif RegionProgOrder() then   return canReachRegionOrder("op_ORD", false, true)
    elseif RegionProg() then        return has("progressive_area", 1)
    elseif RegionOrder() then       return true
    elseif RegionNothing() then     return true
    else                            return false
    end
end

function canChurchmouseStreets()
    if RegionSanityProgOrder() then return has("churchmouse") and canReachRegionOrder("op_OCS", true, true)
    elseif RegionSanityOrder() then return has("churchmouse") and canReachRegionOrder("op_OCS", true, false)
    elseif RegionSanity() then      return has("churchmouse")
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OCS", false, true)
    elseif RegionProg() then        return has("progressive_area", 1)
    elseif RegionOrder() then       return true
    elseif RegionNothing() then     return true
    else                            return false
    end
end

function canEmeraldLakeside()
    if RegionSanityProgOrder() then return has("lakeside") and canReachRegionOrder("op_OEL", true, true)
    elseif RegionSanityOrder() then return has("lakeside") and canReachRegionOrder("op_OEL", true, false)
    elseif RegionSanity() then      return has("lakeside")
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OEL", false, true)
    elseif RegionProg() then        return has("progressive_area", 1)
    elseif RegionOrder() then       return true
    elseif RegionNothing() then     return true
    else                            return false
    end
end

function canPaleKeep()
    if RegionSanityProgOrder() then return has("palekeep") and canReachRegionOrder("op_OPK", true, true)
    elseif RegionSanityOrder() then return has("palekeep") and canReachRegionOrder("op_OPK", true, false)
    elseif RegionSanity() then      return has("palekeep")
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OPK", false, true)
    elseif RegionProg() then        return hasEnoughProgRegion("op_OPK")
    elseif RegionOrder() then       return true
    elseif RegionNothing() then     return true
    else                            return false
    end
end

function canMoonlitPinnacle()
    if RegionSanityProgOrder() then return has("moonlit") and canReachRegionOrder("op_OMP", true, true)
    elseif RegionSanityOrder() then return has("moonlit") and canReachRegionOrder("op_OMP", true, false)
    elseif RegionSanity() then      return has("moonlit")
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OMP", false, true)
    elseif RegionProg() then        return hasEnoughProgRegion("op_OMP")
    elseif RegionOrder() then       return true
    elseif RegionNothing() then     return true
    else                            return false
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

-- Shop logic
function canShopAny()
    if RegionSanityProgOrder() then return canReachFirst() and has("progressive_area", 1)
    elseif RegionSanityOrder() then return canReachAny()
    elseif RegionProgOrder() then   return has("progressive_area", 1)
    elseif RegionProg() then        return has("progressive_area", 1)
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
