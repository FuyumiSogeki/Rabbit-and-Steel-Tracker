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
    local count = Tracker:ProviderCountForCode("progressive_area_shira")
    return count >= order
end

function canReachFirst()
    if has("arsenal") and Tracker:ProviderCountForCode("op_OKA") == 1 and Tracker:ProviderCountForCode("progressive_area_shira") >= 1 then
        return true
    elseif has("scholar") and Tracker:ProviderCountForCode("op_OSN") == 1 and Tracker:ProviderCountForCode("progressive_area_shira") >= 1 then
        return true
    elseif has("darkhouse") and Tracker:ProviderCountForCode("op_ORD") == 1 and Tracker:ProviderCountForCode("progressive_area_shira") >= 1 then
        return true
    elseif has("lakeside") and Tracker:ProviderCountForCode("op_OEL") == 1 and Tracker:ProviderCountForCode("progressive_area_shira") >= 1 then
        return true
    elseif has("churchmouse") and Tracker:ProviderCountForCode("op_OCS") == 1 and Tracker:ProviderCountForCode("progressive_area_shira") >= 1 then
        return true
    elseif has("depths") and Tracker:ProviderCountForCode("op_ODD") == 1 and Tracker:ProviderCountForCode("progressive_area_witch") >= 1 then
        return true
    elseif has("atelier") and Tracker:ProviderCountForCode("op_OAA") == 1 and Tracker:ProviderCountForCode("progressive_area_witch") >= 1 then
        return true
    elseif has("sanctum") and Tracker:ProviderCountForCode("op_OSS") == 1 and Tracker:ProviderCountForCode("progressive_area_witch") >= 1 then
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
    if has("depths") then count = count + 1 end
    if has("atelier") then count = count + 1 end
    if has("sanctum") then count = count + 1 end

    return count >= 1
end

function canReachRegionOrder(regionChecked, reg, prog)
    local regionCheckedOrder = Tracker:ProviderCountForCode(regionChecked)
    local regionReachCount = 0

    print(string.format("region order: %s - reach count: %s", regionCheckedOrder, regionReachCount))

    if regionCheckedOrder > 0 then
        if prog and Tracker:ProviderCountForCode("progressive_area_shira") < regionCheckedOrder then
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
            elseif Tracker:ProviderCountForCode("op_ODD") == 1 and ((reg and has("depths") or not reg)) and ((prog and hasEnoughProgRegion("op_ODD")) or not prog) then regionReachCount = regionReachCount + 1
            elseif Tracker:ProviderCountForCode("op_OAA") == 1 and ((reg and has("atelier") or not reg)) and ((prog and hasEnoughProgRegion("op_OAA")) or not prog) then regionReachCount = regionReachCount + 1
            elseif Tracker:ProviderCountForCode("op_OSS") == 1 and ((reg and has("sanctum") or not reg)) and ((prog and hasEnoughProgRegion("op_OSS")) or not prog) then regionReachCount = regionReachCount + 1
            elseif Tracker:ProviderCountForCode("op_OLH") == 1 and ((reg and has("looping") or not reg)) and ((prog and hasEnoughProgRegion("op_OLH")) or not prog) then regionReachCount = regionReachCount + 1
            elseif Tracker:ProviderCountForCode("op_ORP") == 1 and ((reg and has("pool") or not reg)) and ((prog and hasEnoughProgRegion("op_ORP")) or not prog) then regionReachCount = regionReachCount + 1
            end

            if regionCheckedOrder > 2 then
                    if Tracker:ProviderCountForCode("op_OKA") == 2 and ((reg and has("arsenal")) or not reg) and ((prog and hasEnoughProgRegion("op_OKA")) or not prog) then regionReachCount = regionReachCount + 1
                elseif Tracker:ProviderCountForCode("op_OSN") == 2 and ((reg and has("scholar")) or not reg) and ((prog and hasEnoughProgRegion("op_OSN")) or not prog) then regionReachCount = regionReachCount + 1
                elseif Tracker:ProviderCountForCode("op_ORD") == 2 and ((reg and has("darkhouse")) or not reg) and ((prog and hasEnoughProgRegion("op_ORD")) or not prog) then regionReachCount = regionReachCount + 1
                elseif Tracker:ProviderCountForCode("op_OEL") == 2 and ((reg and has("lakeside")) or not reg) and ((prog and hasEnoughProgRegion("op_OEL")) or not prog) then regionReachCount = regionReachCount + 1
                elseif Tracker:ProviderCountForCode("op_OCS") == 2 and ((reg and has("churchmouse") or not reg)) and ((prog and hasEnoughProgRegion("op_OCS")) or not prog) then regionReachCount = regionReachCount + 1
                elseif Tracker:ProviderCountForCode("op_OPK") == 2 and ((reg and has("palekeep") or not reg)) and ((prog and hasEnoughProgRegion("op_OPK")) or not prog) then regionReachCount = regionReachCount + 1
                elseif Tracker:ProviderCountForCode("op_OMP") == 2 and ((reg and has("moonlit") or not reg)) and ((prog and hasEnoughProgRegion("op_OMP")) or not prog) then regionReachCount = regionReachCount + 1
                elseif Tracker:ProviderCountForCode("op_ODD") == 2 and ((reg and has("depths") or not reg)) and ((prog and hasEnoughProgRegion("op_ODD")) or not prog) then regionReachCount = regionReachCount + 1
                elseif Tracker:ProviderCountForCode("op_OAA") == 2 and ((reg and has("atelier") or not reg)) and ((prog and hasEnoughProgRegion("op_OAA")) or not prog) then regionReachCount = regionReachCount + 1
                elseif Tracker:ProviderCountForCode("op_OSS") == 2 and ((reg and has("sanctum") or not reg)) and ((prog and hasEnoughProgRegion("op_OSS")) or not prog) then regionReachCount = regionReachCount + 1
                elseif Tracker:ProviderCountForCode("op_OLH") == 2 and ((reg and has("looping") or not reg)) and ((prog and hasEnoughProgRegion("op_OLH")) or not prog) then regionReachCount = regionReachCount + 1
                elseif Tracker:ProviderCountForCode("op_ORP") == 2 and ((reg and has("pool") or not reg)) and ((prog and hasEnoughProgRegion("op_ORP")) or not prog) then regionReachCount = regionReachCount + 1
                end

                if regionCheckedOrder > 3 then
                        if Tracker:ProviderCountForCode("op_OKA") == 3 and ((reg and has("arsenal")) or not reg) and ((prog and hasEnoughProgRegion("op_OKA")) or not prog) then regionReachCount = regionReachCount + 1
                    elseif Tracker:ProviderCountForCode("op_OSN") == 3 and ((reg and has("scholar")) or not reg) and ((prog and hasEnoughProgRegion("op_OSN")) or not prog) then regionReachCount = regionReachCount + 1
                    elseif Tracker:ProviderCountForCode("op_ORD") == 3 and ((reg and has("darkhouse")) or not reg) and ((prog and hasEnoughProgRegion("op_ORD")) or not prog) then regionReachCount = regionReachCount + 1
                    elseif Tracker:ProviderCountForCode("op_OEL") == 3 and ((reg and has("lakeside")) or not reg) and ((prog and hasEnoughProgRegion("op_OEL")) or not prog) then regionReachCount = regionReachCount + 1
                    elseif Tracker:ProviderCountForCode("op_OCS") == 3 and ((reg and has("churchmouse") or not reg)) and ((prog and hasEnoughProgRegion("op_OCS")) or not prog) then regionReachCount = regionReachCount + 1
                    elseif Tracker:ProviderCountForCode("op_OPK") == 3 and ((reg and has("palekeep") or not reg)) and ((prog and hasEnoughProgRegion("op_OPK")) or not prog) then regionReachCount = regionReachCount + 1
                    elseif Tracker:ProviderCountForCode("op_OMP") == 3 and ((reg and has("moonlit") or not reg)) and ((prog and hasEnoughProgRegion("op_OMP")) or not prog) then regionReachCount = regionReachCount + 1
                    elseif Tracker:ProviderCountForCode("op_ODD") == 3 and ((reg and has("depths") or not reg)) and ((prog and hasEnoughProgRegion("op_ODD")) or not prog) then regionReachCount = regionReachCount + 1
                    elseif Tracker:ProviderCountForCode("op_OAA") == 3 and ((reg and has("atelier") or not reg)) and ((prog and hasEnoughProgRegion("op_OAA")) or not prog) then regionReachCount = regionReachCount + 1
                    elseif Tracker:ProviderCountForCode("op_OSS") == 3 and ((reg and has("sanctum") or not reg)) and ((prog and hasEnoughProgRegion("op_OSS")) or not prog) then regionReachCount = regionReachCount + 1
                    elseif Tracker:ProviderCountForCode("op_OLH") == 3 and ((reg and has("looping") or not reg)) and ((prog and hasEnoughProgRegion("op_OLH")) or not prog) then regionReachCount = regionReachCount + 1
                    elseif Tracker:ProviderCountForCode("op_ORP") == 3 and ((reg and has("pool") or not reg)) and ((prog and hasEnoughProgRegion("op_ORP")) or not prog) then regionReachCount = regionReachCount + 1
                    end

                    if regionCheckedOrder > 4 then
                            if Tracker:ProviderCountForCode("op_OKA") == 4 and ((reg and has("arsenal")) or not reg) and ((prog and hasEnoughProgRegion("op_OKA")) or not prog) then regionReachCount = regionReachCount + 1
                        elseif Tracker:ProviderCountForCode("op_OSN") == 4 and ((reg and has("scholar")) or not reg) and ((prog and hasEnoughProgRegion("op_OSN")) or not prog) then regionReachCount = regionReachCount + 1
                        elseif Tracker:ProviderCountForCode("op_ORD") == 4 and ((reg and has("darkhouse")) or not reg) and ((prog and hasEnoughProgRegion("op_ORD")) or not prog) then regionReachCount = regionReachCount + 1
                        elseif Tracker:ProviderCountForCode("op_OEL") == 4 and ((reg and has("lakeside")) or not reg) and ((prog and hasEnoughProgRegion("op_OEL")) or not prog) then regionReachCount = regionReachCount + 1
                        elseif Tracker:ProviderCountForCode("op_OCS") == 4 and ((reg and has("churchmouse") or not reg)) and ((prog and hasEnoughProgRegion("op_OCS")) or not prog) then regionReachCount = regionReachCount + 1
                        elseif Tracker:ProviderCountForCode("op_OPK") == 4 and ((reg and has("palekeep") or not reg)) and ((prog and hasEnoughProgRegion("op_OPK")) or not prog) then regionReachCount = regionReachCount + 1
                        elseif Tracker:ProviderCountForCode("op_OMP") == 4 and ((reg and has("moonlit") or not reg)) and ((prog and hasEnoughProgRegion("op_OMP")) or not prog) then regionReachCount = regionReachCount + 1
                        elseif Tracker:ProviderCountForCode("op_ODD") == 4 and ((reg and has("depths") or not reg)) and ((prog and hasEnoughProgRegion("op_ODD")) or not prog) then regionReachCount = regionReachCount + 1
                        elseif Tracker:ProviderCountForCode("op_OAA") == 4 and ((reg and has("atelier") or not reg)) and ((prog and hasEnoughProgRegion("op_OAA")) or not prog) then regionReachCount = regionReachCount + 1
                        elseif Tracker:ProviderCountForCode("op_OSS") == 4 and ((reg and has("sanctum") or not reg)) and ((prog and hasEnoughProgRegion("op_OSS")) or not prog) then regionReachCount = regionReachCount + 1
                        elseif Tracker:ProviderCountForCode("op_OLH") == 4 and ((reg and has("looping") or not reg)) and ((prog and hasEnoughProgRegion("op_OLH")) or not prog) then regionReachCount = regionReachCount + 1
                        elseif Tracker:ProviderCountForCode("op_ORP") == 4 and ((reg and has("pool") or not reg)) and ((prog and hasEnoughProgRegion("op_ORP")) or not prog) then regionReachCount = regionReachCount + 1
                        end

                        if regionCheckedOrder > 5 then
                                if Tracker:ProviderCountForCode("op_OKA") == 5 and ((reg and has("arsenal")) or not reg) and ((prog and hasEnoughProgRegion("op_OKA")) or not prog) then regionReachCount = regionReachCount + 1
                            elseif Tracker:ProviderCountForCode("op_OSN") == 5 and ((reg and has("scholar")) or not reg) and ((prog and hasEnoughProgRegion("op_OSN")) or not prog) then regionReachCount = regionReachCount + 1
                            elseif Tracker:ProviderCountForCode("op_ORD") == 5 and ((reg and has("darkhouse")) or not reg) and ((prog and hasEnoughProgRegion("op_ORD")) or not prog) then regionReachCount = regionReachCount + 1
                            elseif Tracker:ProviderCountForCode("op_OEL") == 5 and ((reg and has("lakeside")) or not reg) and ((prog and hasEnoughProgRegion("op_OEL")) or not prog) then regionReachCount = regionReachCount + 1
                            elseif Tracker:ProviderCountForCode("op_OCS") == 5 and ((reg and has("churchmouse") or not reg)) and ((prog and hasEnoughProgRegion("op_OCS")) or not prog) then regionReachCount = regionReachCount + 1
                            elseif Tracker:ProviderCountForCode("op_OPK") == 5 and ((reg and has("palekeep") or not reg)) and ((prog and hasEnoughProgRegion("op_OPK")) or not prog) then regionReachCount = regionReachCount + 1
                            elseif Tracker:ProviderCountForCode("op_OMP") == 5 and ((reg and has("moonlit") or not reg)) and ((prog and hasEnoughProgRegion("op_OMP")) or not prog) then regionReachCount = regionReachCount + 1
                            elseif Tracker:ProviderCountForCode("op_ODD") == 5 and ((reg and has("depths") or not reg)) and ((prog and hasEnoughProgRegion("op_ODD")) or not prog) then regionReachCount = regionReachCount + 1
                            elseif Tracker:ProviderCountForCode("op_OAA") == 5 and ((reg and has("atelier") or not reg)) and ((prog and hasEnoughProgRegion("op_OAA")) or not prog) then regionReachCount = regionReachCount + 1
                            elseif Tracker:ProviderCountForCode("op_OSS") == 5 and ((reg and has("sanctum") or not reg)) and ((prog and hasEnoughProgRegion("op_OSS")) or not prog) then regionReachCount = regionReachCount + 1
                            elseif Tracker:ProviderCountForCode("op_OLH") == 5 and ((reg and has("looping") or not reg)) and ((prog and hasEnoughProgRegion("op_OLH")) or not prog) then regionReachCount = regionReachCount + 1
                            elseif Tracker:ProviderCountForCode("op_ORP") == 5 and ((reg and has("pool") or not reg)) and ((prog and hasEnoughProgRegion("op_ORP")) or not prog) then regionReachCount = regionReachCount + 1
                            end

                            if regionCheckedOrder > 6 then
                                    if Tracker:ProviderCountForCode("op_OKA") == 6 and ((reg and has("arsenal")) or not reg) and ((prog and hasEnoughProgRegion("op_OKA")) or not prog) then regionReachCount = regionReachCount + 1
                                elseif Tracker:ProviderCountForCode("op_OSN") == 6 and ((reg and has("scholar")) or not reg) and ((prog and hasEnoughProgRegion("op_OSN")) or not prog) then regionReachCount = regionReachCount + 1
                                elseif Tracker:ProviderCountForCode("op_ORD") == 6 and ((reg and has("darkhouse")) or not reg) and ((prog and hasEnoughProgRegion("op_ORD")) or not prog) then regionReachCount = regionReachCount + 1
                                elseif Tracker:ProviderCountForCode("op_OEL") == 6 and ((reg and has("lakeside")) or not reg) and ((prog and hasEnoughProgRegion("op_OEL")) or not prog) then regionReachCount = regionReachCount + 1
                                elseif Tracker:ProviderCountForCode("op_OCS") == 6 and ((reg and has("churchmouse") or not reg)) and ((prog and hasEnoughProgRegion("op_OCS")) or not prog) then regionReachCount = regionReachCount + 1
                                elseif Tracker:ProviderCountForCode("op_OPK") == 6 and ((reg and has("palekeep") or not reg)) and ((prog and hasEnoughProgRegion("op_OPK")) or not prog) then regionReachCount = regionReachCount + 1
                                elseif Tracker:ProviderCountForCode("op_OMP") == 6 and ((reg and has("moonlit") or not reg)) and ((prog and hasEnoughProgRegion("op_OMP")) or not prog) then regionReachCount = regionReachCount + 1
                                elseif Tracker:ProviderCountForCode("op_ODD") == 6 and ((reg and has("depths") or not reg)) and ((prog and hasEnoughProgRegion("op_ODD")) or not prog) then regionReachCount = regionReachCount + 1
                                elseif Tracker:ProviderCountForCode("op_OAA") == 6 and ((reg and has("atelier") or not reg)) and ((prog and hasEnoughProgRegion("op_OAA")) or not prog) then regionReachCount = regionReachCount + 1
                                elseif Tracker:ProviderCountForCode("op_OSS") == 6 and ((reg and has("sanctum") or not reg)) and ((prog and hasEnoughProgRegion("op_OSS")) or not prog) then regionReachCount = regionReachCount + 1
                                elseif Tracker:ProviderCountForCode("op_OLH") == 6 and ((reg and has("looping") or not reg)) and ((prog and hasEnoughProgRegion("op_OLH")) or not prog) then regionReachCount = regionReachCount + 1
                                elseif Tracker:ProviderCountForCode("op_ORP") == 6 and ((reg and has("pool") or not reg)) and ((prog and hasEnoughProgRegion("op_ORP")) or not prog) then regionReachCount = regionReachCount + 1
                                end

                                if regionCheckedOrder > 7 then
                                        if Tracker:ProviderCountForCode("op_OKA") == 7 and ((reg and has("arsenal")) or not reg) and ((prog and hasEnoughProgRegion("op_OKA")) or not prog) then regionReachCount = regionReachCount + 1
                                    elseif Tracker:ProviderCountForCode("op_OSN") == 7 and ((reg and has("scholar")) or not reg) and ((prog and hasEnoughProgRegion("op_OSN")) or not prog) then regionReachCount = regionReachCount + 1
                                    elseif Tracker:ProviderCountForCode("op_ORD") == 7 and ((reg and has("darkhouse")) or not reg) and ((prog and hasEnoughProgRegion("op_ORD")) or not prog) then regionReachCount = regionReachCount + 1
                                    elseif Tracker:ProviderCountForCode("op_OEL") == 7 and ((reg and has("lakeside")) or not reg) and ((prog and hasEnoughProgRegion("op_OEL")) or not prog) then regionReachCount = regionReachCount + 1
                                    elseif Tracker:ProviderCountForCode("op_OCS") == 7 and ((reg and has("churchmouse") or not reg)) and ((prog and hasEnoughProgRegion("op_OCS")) or not prog) then regionReachCount = regionReachCount + 1
                                    elseif Tracker:ProviderCountForCode("op_OPK") == 7 and ((reg and has("palekeep") or not reg)) and ((prog and hasEnoughProgRegion("op_OPK")) or not prog) then regionReachCount = regionReachCount + 1
                                    elseif Tracker:ProviderCountForCode("op_OMP") == 7 and ((reg and has("moonlit") or not reg)) and ((prog and hasEnoughProgRegion("op_OMP")) or not prog) then regionReachCount = regionReachCount + 1
                                    elseif Tracker:ProviderCountForCode("op_ODD") == 7 and ((reg and has("depths") or not reg)) and ((prog and hasEnoughProgRegion("op_ODD")) or not prog) then regionReachCount = regionReachCount + 1
                                    elseif Tracker:ProviderCountForCode("op_OAA") == 7 and ((reg and has("atelier") or not reg)) and ((prog and hasEnoughProgRegion("op_OAA")) or not prog) then regionReachCount = regionReachCount + 1
                                    elseif Tracker:ProviderCountForCode("op_OSS") == 7 and ((reg and has("sanctum") or not reg)) and ((prog and hasEnoughProgRegion("op_OSS")) or not prog) then regionReachCount = regionReachCount + 1
                                    elseif Tracker:ProviderCountForCode("op_OLH") == 7 and ((reg and has("looping") or not reg)) and ((prog and hasEnoughProgRegion("op_OLH")) or not prog) then regionReachCount = regionReachCount + 1
                                    elseif Tracker:ProviderCountForCode("op_ORP") == 7 and ((reg and has("pool") or not reg)) and ((prog and hasEnoughProgRegion("op_ORP")) or not prog) then regionReachCount = regionReachCount + 1
                                    end

                                    if regionCheckedOrder > 8 then
                                            if Tracker:ProviderCountForCode("op_OKA") == 8 and ((reg and has("arsenal")) or not reg) and ((prog and hasEnoughProgRegion("op_OKA")) or not prog) then regionReachCount = regionReachCount + 1
                                        elseif Tracker:ProviderCountForCode("op_OSN") == 8 and ((reg and has("scholar")) or not reg) and ((prog and hasEnoughProgRegion("op_OSN")) or not prog) then regionReachCount = regionReachCount + 1
                                        elseif Tracker:ProviderCountForCode("op_ORD") == 8 and ((reg and has("darkhouse")) or not reg) and ((prog and hasEnoughProgRegion("op_ORD")) or not prog) then regionReachCount = regionReachCount + 1
                                        elseif Tracker:ProviderCountForCode("op_OEL") == 8 and ((reg and has("lakeside")) or not reg) and ((prog and hasEnoughProgRegion("op_OEL")) or not prog) then regionReachCount = regionReachCount + 1
                                        elseif Tracker:ProviderCountForCode("op_OCS") == 8 and ((reg and has("churchmouse") or not reg)) and ((prog and hasEnoughProgRegion("op_OCS")) or not prog) then regionReachCount = regionReachCount + 1
                                        elseif Tracker:ProviderCountForCode("op_OPK") == 8 and ((reg and has("palekeep") or not reg)) and ((prog and hasEnoughProgRegion("op_OPK")) or not prog) then regionReachCount = regionReachCount + 1
                                        elseif Tracker:ProviderCountForCode("op_OMP") == 8 and ((reg and has("moonlit") or not reg)) and ((prog and hasEnoughProgRegion("op_OMP")) or not prog) then regionReachCount = regionReachCount + 1
                                        elseif Tracker:ProviderCountForCode("op_ODD") == 8 and ((reg and has("depths") or not reg)) and ((prog and hasEnoughProgRegion("op_ODD")) or not prog) then regionReachCount = regionReachCount + 1
                                        elseif Tracker:ProviderCountForCode("op_OAA") == 8 and ((reg and has("atelier") or not reg)) and ((prog and hasEnoughProgRegion("op_OAA")) or not prog) then regionReachCount = regionReachCount + 1
                                        elseif Tracker:ProviderCountForCode("op_OSS") == 8 and ((reg and has("sanctum") or not reg)) and ((prog and hasEnoughProgRegion("op_OSS")) or not prog) then regionReachCount = regionReachCount + 1
                                        elseif Tracker:ProviderCountForCode("op_OLH") == 8 and ((reg and has("looping") or not reg)) and ((prog and hasEnoughProgRegion("op_OLH")) or not prog) then regionReachCount = regionReachCount + 1
                                        elseif Tracker:ProviderCountForCode("op_ORP") == 8 and ((reg and has("pool") or not reg)) and ((prog and hasEnoughProgRegion("op_ORP")) or not prog) then regionReachCount = regionReachCount + 1
                                        end

                                        if regionCheckedOrder > 9 then
                                                if Tracker:ProviderCountForCode("op_OKA") == 9 and ((reg and has("arsenal")) or not reg) and ((prog and hasEnoughProgRegion("op_OKA")) or not prog) then regionReachCount = regionReachCount + 1
                                            elseif Tracker:ProviderCountForCode("op_OSN") == 9 and ((reg and has("scholar")) or not reg) and ((prog and hasEnoughProgRegion("op_OSN")) or not prog) then regionReachCount = regionReachCount + 1
                                            elseif Tracker:ProviderCountForCode("op_ORD") == 9 and ((reg and has("darkhouse")) or not reg) and ((prog and hasEnoughProgRegion("op_ORD")) or not prog) then regionReachCount = regionReachCount + 1
                                            elseif Tracker:ProviderCountForCode("op_OEL") == 9 and ((reg and has("lakeside")) or not reg) and ((prog and hasEnoughProgRegion("op_OEL")) or not prog) then regionReachCount = regionReachCount + 1
                                            elseif Tracker:ProviderCountForCode("op_OCS") == 9 and ((reg and has("churchmouse") or not reg)) and ((prog and hasEnoughProgRegion("op_OCS")) or not prog) then regionReachCount = regionReachCount + 1
                                            elseif Tracker:ProviderCountForCode("op_OPK") == 9 and ((reg and has("palekeep") or not reg)) and ((prog and hasEnoughProgRegion("op_OPK")) or not prog) then regionReachCount = regionReachCount + 1
                                            elseif Tracker:ProviderCountForCode("op_OMP") == 9 and ((reg and has("moonlit") or not reg)) and ((prog and hasEnoughProgRegion("op_OMP")) or not prog) then regionReachCount = regionReachCount + 1
                                            elseif Tracker:ProviderCountForCode("op_ODD") == 9 and ((reg and has("depths") or not reg)) and ((prog and hasEnoughProgRegion("op_ODD")) or not prog) then regionReachCount = regionReachCount + 1
                                            elseif Tracker:ProviderCountForCode("op_OAA") == 9 and ((reg and has("atelier") or not reg)) and ((prog and hasEnoughProgRegion("op_OAA")) or not prog) then regionReachCount = regionReachCount + 1
                                            elseif Tracker:ProviderCountForCode("op_OSS") == 9 and ((reg and has("sanctum") or not reg)) and ((prog and hasEnoughProgRegion("op_OSS")) or not prog) then regionReachCount = regionReachCount + 1
                                            elseif Tracker:ProviderCountForCode("op_OLH") == 9 and ((reg and has("looping") or not reg)) and ((prog and hasEnoughProgRegion("op_OLH")) or not prog) then regionReachCount = regionReachCount + 1
                                            elseif Tracker:ProviderCountForCode("op_ORP") == 9 and ((reg and has("pool") or not reg)) and ((prog and hasEnoughProgRegion("op_ORP")) or not prog) then regionReachCount = regionReachCount + 1
                                            end

                                            if regionCheckedOrder > 10 then
                                                    if Tracker:ProviderCountForCode("op_OKA") == 10 and ((reg and has("arsenal")) or not reg) and ((prog and hasEnoughProgRegion("op_OKA")) or not prog) then regionReachCount = regionReachCount + 1
                                                elseif Tracker:ProviderCountForCode("op_OSN") == 10 and ((reg and has("scholar")) or not reg) and ((prog and hasEnoughProgRegion("op_OSN")) or not prog) then regionReachCount = regionReachCount + 1
                                                elseif Tracker:ProviderCountForCode("op_ORD") == 10 and ((reg and has("darkhouse")) or not reg) and ((prog and hasEnoughProgRegion("op_ORD")) or not prog) then regionReachCount = regionReachCount + 1
                                                elseif Tracker:ProviderCountForCode("op_OEL") == 10 and ((reg and has("lakeside")) or not reg) and ((prog and hasEnoughProgRegion("op_OEL")) or not prog) then regionReachCount = regionReachCount + 1
                                                elseif Tracker:ProviderCountForCode("op_OCS") == 10 and ((reg and has("churchmouse") or not reg)) and ((prog and hasEnoughProgRegion("op_OCS")) or not prog) then regionReachCount = regionReachCount + 1
                                                elseif Tracker:ProviderCountForCode("op_OPK") == 10 and ((reg and has("palekeep") or not reg)) and ((prog and hasEnoughProgRegion("op_OPK")) or not prog) then regionReachCount = regionReachCount + 1
                                                elseif Tracker:ProviderCountForCode("op_OMP") == 10 and ((reg and has("moonlit") or not reg)) and ((prog and hasEnoughProgRegion("op_OMP")) or not prog) then regionReachCount = regionReachCount + 1
                                                elseif Tracker:ProviderCountForCode("op_ODD") == 10 and ((reg and has("depths") or not reg)) and ((prog and hasEnoughProgRegion("op_ODD")) or not prog) then regionReachCount = regionReachCount + 1
                                                elseif Tracker:ProviderCountForCode("op_OAA") == 10 and ((reg and has("atelier") or not reg)) and ((prog and hasEnoughProgRegion("op_OAA")) or not prog) then regionReachCount = regionReachCount + 1
                                                elseif Tracker:ProviderCountForCode("op_OSS") == 10 and ((reg and has("sanctum") or not reg)) and ((prog and hasEnoughProgRegion("op_OSS")) or not prog) then regionReachCount = regionReachCount + 1
                                                elseif Tracker:ProviderCountForCode("op_OLH") == 10 and ((reg and has("looping") or not reg)) and ((prog and hasEnoughProgRegion("op_OLH")) or not prog) then regionReachCount = regionReachCount + 1
                                                elseif Tracker:ProviderCountForCode("op_ORP") == 10 and ((reg and has("pool") or not reg)) and ((prog and hasEnoughProgRegion("op_ORP")) or not prog) then regionReachCount = regionReachCount + 1
                                                end

                                                if regionCheckedOrder > 11 then
                                                        if Tracker:ProviderCountForCode("op_OKA") == 11 and ((reg and has("arsenal")) or not reg) and ((prog and hasEnoughProgRegion("op_OKA")) or not prog) then regionReachCount = regionReachCount + 1
                                                    elseif Tracker:ProviderCountForCode("op_OSN") == 11 and ((reg and has("scholar")) or not reg) and ((prog and hasEnoughProgRegion("op_OSN")) or not prog) then regionReachCount = regionReachCount + 1
                                                    elseif Tracker:ProviderCountForCode("op_ORD") == 11 and ((reg and has("darkhouse")) or not reg) and ((prog and hasEnoughProgRegion("op_ORD")) or not prog) then regionReachCount = regionReachCount + 1
                                                    elseif Tracker:ProviderCountForCode("op_OEL") == 11 and ((reg and has("lakeside")) or not reg) and ((prog and hasEnoughProgRegion("op_OEL")) or not prog) then regionReachCount = regionReachCount + 1
                                                    elseif Tracker:ProviderCountForCode("op_OCS") == 11 and ((reg and has("churchmouse") or not reg)) and ((prog and hasEnoughProgRegion("op_OCS")) or not prog) then regionReachCount = regionReachCount + 1
                                                    elseif Tracker:ProviderCountForCode("op_OPK") == 11 and ((reg and has("palekeep") or not reg)) and ((prog and hasEnoughProgRegion("op_OPK")) or not prog) then regionReachCount = regionReachCount + 1
                                                    elseif Tracker:ProviderCountForCode("op_OMP") == 11 and ((reg and has("moonlit") or not reg)) and ((prog and hasEnoughProgRegion("op_OMP")) or not prog) then regionReachCount = regionReachCount + 1
                                                    elseif Tracker:ProviderCountForCode("op_ODD") == 11 and ((reg and has("depths") or not reg)) and ((prog and hasEnoughProgRegion("op_ODD")) or not prog) then regionReachCount = regionReachCount + 1
                                                    elseif Tracker:ProviderCountForCode("op_OAA") == 11 and ((reg and has("atelier") or not reg)) and ((prog and hasEnoughProgRegion("op_OAA")) or not prog) then regionReachCount = regionReachCount + 1
                                                    elseif Tracker:ProviderCountForCode("op_OSS") == 11 and ((reg and has("sanctum") or not reg)) and ((prog and hasEnoughProgRegion("op_OSS")) or not prog) then regionReachCount = regionReachCount + 1
                                                    elseif Tracker:ProviderCountForCode("op_OLH") == 11 and ((reg and has("looping") or not reg)) and ((prog and hasEnoughProgRegion("op_OLH")) or not prog) then regionReachCount = regionReachCount + 1
                                                    elseif Tracker:ProviderCountForCode("op_ORP") == 11 and ((reg and has("pool") or not reg)) and ((prog and hasEnoughProgRegion("op_ORP")) or not prog) then regionReachCount = regionReachCount + 1
                                                    end

                                                    if regionCheckedOrder > 12 then
                                                            if Tracker:ProviderCountForCode("op_OKA") == 12 and ((reg and has("arsenal")) or not reg) and ((prog and hasEnoughProgRegion("op_OKA")) or not prog) then regionReachCount = regionReachCount + 1
                                                        elseif Tracker:ProviderCountForCode("op_OSN") == 12 and ((reg and has("scholar")) or not reg) and ((prog and hasEnoughProgRegion("op_OSN")) or not prog) then regionReachCount = regionReachCount + 1
                                                        elseif Tracker:ProviderCountForCode("op_ORD") == 12 and ((reg and has("darkhouse")) or not reg) and ((prog and hasEnoughProgRegion("op_ORD")) or not prog) then regionReachCount = regionReachCount + 1
                                                        elseif Tracker:ProviderCountForCode("op_OEL") == 12 and ((reg and has("lakeside")) or not reg) and ((prog and hasEnoughProgRegion("op_OEL")) or not prog) then regionReachCount = regionReachCount + 1
                                                        elseif Tracker:ProviderCountForCode("op_OCS") == 12 and ((reg and has("churchmouse") or not reg)) and ((prog and hasEnoughProgRegion("op_OCS")) or not prog) then regionReachCount = regionReachCount + 1
                                                        elseif Tracker:ProviderCountForCode("op_OPK") == 12 and ((reg and has("palekeep") or not reg)) and ((prog and hasEnoughProgRegion("op_OPK")) or not prog) then regionReachCount = regionReachCount + 1
                                                        elseif Tracker:ProviderCountForCode("op_OMP") == 12 and ((reg and has("moonlit") or not reg)) and ((prog and hasEnoughProgRegion("op_OMP")) or not prog) then regionReachCount = regionReachCount + 1
                                                        elseif Tracker:ProviderCountForCode("op_ODD") == 12 and ((reg and has("depths") or not reg)) and ((prog and hasEnoughProgRegion("op_ODD")) or not prog) then regionReachCount = regionReachCount + 1
                                                        elseif Tracker:ProviderCountForCode("op_OAA") == 12 and ((reg and has("atelier") or not reg)) and ((prog and hasEnoughProgRegion("op_OAA")) or not prog) then regionReachCount = regionReachCount + 1
                                                        elseif Tracker:ProviderCountForCode("op_OSS") == 12 and ((reg and has("sanctum") or not reg)) and ((prog and hasEnoughProgRegion("op_OSS")) or not prog) then regionReachCount = regionReachCount + 1
                                                        elseif Tracker:ProviderCountForCode("op_OLH") == 12 and ((reg and has("looping") or not reg)) and ((prog and hasEnoughProgRegion("op_OLH")) or not prog) then regionReachCount = regionReachCount + 1
                                                        elseif Tracker:ProviderCountForCode("op_ORP") == 12 and ((reg and has("pool") or not reg)) and ((prog and hasEnoughProgRegion("op_ORP")) or not prog) then regionReachCount = regionReachCount + 1
                                                        end
                                                    end
                                                end
                                            end
                                        end
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
    elseif Tracker:ProviderCountForCode("op_ODD") == 1 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 1 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 1 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 2 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 2 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 2 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 2 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 2 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 2 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 2 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 2 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 3 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 3 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 3 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 3 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 3 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 3 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 3 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 3 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 4 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 4 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 4 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 4 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 4 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 4 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 4 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 4 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 5 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 5 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 5 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 5 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 5 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 5 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 5 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 5 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 6 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 6 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 6 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 6 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 6 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 6 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 6 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 6 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 7 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 7 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 7 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 7 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 7 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 7 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 7 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 7 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 8 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 8 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 8 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 8 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 8 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 8 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 8 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 8 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
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
    if has("depths") then count = count + 1 end
    if has("atelier") then count = count + 1 end
    if has("sanctum") then count = count + 1 end

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
    elseif Tracker:ProviderCountForCode("op_ODD") == 1 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 1 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 1 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 2 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 2 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 2 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 2 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 2 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 2 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 2 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 2 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 3 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 3 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 3 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 3 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 3 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 3 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 3 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 3 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 4 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 4 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 4 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 4 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 4 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 4 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 4 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 4 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 5 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 5 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 5 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 5 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 5 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 5 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 5 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 5 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 6 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 6 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 6 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 6 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 6 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 6 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 6 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 6 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 7 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 7 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 7 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 7 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 7 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 7 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 7 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 7 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 8 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 8 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 8 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 8 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 8 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 8 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 8 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 8 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
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
    if has("depths") then count = count + 1 end
    if has("atelier") then count = count + 1 end
    if has("sanctum") then count = count + 1 end

    return count >= order and has("palekeep")
end

function canReachHallwayOrder()
    local order = Tracker:ProviderCountForCode("op_OLH")
    local count = 1

    if Tracker:ProviderCountForCode("op_OKA") == 1 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 1 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 1 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 1 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 1 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 1 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 1 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 1 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 2 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 2 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 2 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 2 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 2 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 2 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 2 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 2 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 3 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 3 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 3 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 3 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 3 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 3 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 3 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 3 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 4 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 4 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 4 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 4 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 4 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 4 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 4 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 4 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 5 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 5 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 5 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 5 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 5 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 5 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 5 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 5 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 6 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 6 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 6 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 6 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 6 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 6 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 6 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 6 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 7 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 7 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 7 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 7 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 7 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 7 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 7 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 7 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 8 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 8 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 8 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 8 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 8 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 8 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 8 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 8 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    return count >= order
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

function canReachPoolOrder()
    local order = Tracker:ProviderCountForCode("op_ORP")
    local count = 2

    if Tracker:ProviderCountForCode("op_OKA") == 1 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 1 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 1 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 1 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 1 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 1 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 1 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 1 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 2 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 2 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 2 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 2 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 2 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 2 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 2 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 2 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 3 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 3 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 3 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 3 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 3 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 3 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 3 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 3 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 4 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 4 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 4 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 4 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 4 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 4 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 4 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 4 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 5 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 5 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 5 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 5 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 5 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 5 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 5 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 5 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 6 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 6 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 6 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 6 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 6 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 6 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 6 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 6 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 7 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 7 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 7 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 7 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 7 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 7 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 7 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 7 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    if Tracker:ProviderCountForCode("op_OKA") == 8 and has("arsenal") and hasEnoughProgRegion("op_OKA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSN") == 8 and has("scholar") and hasEnoughProgRegion("op_OSN") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ORD") == 8 and has("darkhouse") and hasEnoughProgRegion("op_ORD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OEL") == 8 and has("lakeside") and hasEnoughProgRegion("op_OEL") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OCS") == 8 and has("churchmouse") and hasEnoughProgRegion("op_OCS") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_ODD") == 8 and has("depths") and hasEnoughProgRegion("op_ODD") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OAA") == 8 and has("atelier") and hasEnoughProgRegion("op_OAA") then count = count + 1
    elseif Tracker:ProviderCountForCode("op_OSS") == 8 and has("sanctum") and hasEnoughProgRegion("op_OSS") then count = count + 1
    end

    return count >= order and has("looping")
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
    if RegionSanityProgOrder() then return has("arsenal") and canReachRegionOrder("op_OKA", true, true) and canOutskirts()
    elseif RegionSanityOrder() then return has("arsenal") and canReachRegionOrder("op_OKA", true, false) and canOutskirts()
    elseif RegionSanityProg() then  return has("arsenal") and has("progressive_area_shira", 1) and canOutskirts()
    elseif RegionSanity() then      return has("arsenal") and canOutskirts()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OKA", false, true) and canOutskirts()
    elseif RegionProg() then        return has("progressive_area_shira", 1) and canOutskirts()
    elseif RegionOrder() then       return true and canOutskirts()
    elseif RegionNothing() then     return true and canOutskirts()
    else                            return false and canOutskirts()
    end
end

function canScholarNest()
    if RegionSanityProgOrder() then return has("scholar") and canReachRegionOrder("op_OSN", true, true) and canOutskirts()
    elseif RegionSanityOrder() then return has("scholar") and canReachRegionOrder("op_OSN", true, false) and canOutskirts()
    elseif RegionSanityProg() then  return has("scholar") and has("progressive_area_shira", 1) and canOutskirts()
    elseif RegionSanity() then      return has("scholar") and canOutskirts()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OSN", false, true) and canOutskirts()
    elseif RegionProg() then        return has("progressive_area_shira", 1) and canOutskirts()
    elseif RegionOrder() then       return true and canOutskirts()
    elseif RegionNothing() then     return true and canOutskirts()
    else                            return false and canOutskirts()
    end
end

function canRedDarkhouse()
    if RegionSanityProgOrder() then return has("darkhouse") and canReachRegionOrder("op_ORD", true, true) and canOutskirts()
    elseif RegionSanityOrder() then return has("darkhouse") and canReachRegionOrder("op_ORD", true, false) and canOutskirts()
    elseif RegionSanityProg() then  return has("darkhouse") and has("progressive_area_shira", 1) and canOutskirts()
    elseif RegionSanity() then      return has("darkhouse") and canOutskirts()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_ORD", false, true) and canOutskirts()
    elseif RegionProg() then        return has("progressive_area_shira", 1) and canOutskirts()
    elseif RegionOrder() then       return true and canOutskirts()
    elseif RegionNothing() then     return true and canOutskirts()
    else                            return false and canOutskirts()
    end
end

function canChurchmouseStreets()
    if RegionSanityProgOrder() then return has("churchmouse") and canReachRegionOrder("op_OCS", true, true) and canOutskirts()
    elseif RegionSanityOrder() then return has("churchmouse") and canReachRegionOrder("op_OCS", true, false) and canOutskirts()
    elseif RegionSanityProg() then  return has("churchmouse") and has("progressive_area_shira", 1) and canOutskirts()
    elseif RegionSanity() then      return has("churchmouse") and canOutskirts()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OCS", false, true) and canOutskirts()
    elseif RegionProg() then        return has("progressive_area_shira", 1) and canOutskirts()
    elseif RegionOrder() then       return true and canOutskirts()
    elseif RegionNothing() then     return true and canOutskirts()
    else                            return false and canOutskirts()
    end
end

function canEmeraldLakeside()
    if RegionSanityProgOrder() then return has("lakeside") and canReachRegionOrder("op_OEL", true, true) and canOutskirts()
    elseif RegionSanityOrder() then return has("lakeside") and canReachRegionOrder("op_OEL", true, false) and canOutskirts()
    elseif RegionSanityProg() then  return has("lakeside") and has("progressive_area_shira", 1) and canOutskirts()
    elseif RegionSanity() then      return has("lakeside") and canOutskirts()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OEL", false, true) and canOutskirts()
    elseif RegionProg() then        return has("progressive_area_shira", 1) and canOutskirts()
    elseif RegionOrder() then       return true and canOutskirts()
    elseif RegionNothing() then     return true and canOutskirts()
    else                            return false and canOutskirts()
    end
end

function canPaleKeep()
    if RegionSanityProgOrder() then return has("palekeep") and canReachRegionOrder("op_OPK", true, true) and canOutskirts()
    elseif RegionSanityOrder() then return has("palekeep") and canReachRegionOrder("op_OPK", true, false) and canOutskirts()
    elseif RegionSanityProg() then  return has("palekeep") and canReachPaleKeep() and hasEnoughProgRegion("op_OPK") and canOutskirts()
    elseif RegionSanity() then      return has("palekeep") and canReachPaleKeep() and canOutskirts()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OPK", false, true) and canOutskirts()
    elseif RegionProg() then        return hasEnoughProgRegion("op_OPK") and canOutskirts()
    elseif RegionOrder() then       return true and canOutskirts()
    elseif RegionNothing() then     return true and canOutskirts()
    else                            return false and canOutskirts()
    end
end

function canMoonlitPinnacle()
    if RegionSanityProgOrder() then return has("moonlit") and canReachRegionOrder("op_OMP", true, true) and canOutskirts()
    elseif RegionSanityOrder() then return has("moonlit") and canReachRegionOrder("op_OMP", true, false) and canOutskirts()
    elseif RegionSanityProg() then  return has("moonlit") and canReachPinnacle() and hasEnoughProgRegion("op_OMP") and canOutskirts()
    elseif RegionSanity() then      return has("moonlit") and canReachPinnacle() and canOutskirts()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OMP", false, true) and canOutskirts()
    elseif RegionProg() then        return hasEnoughProgRegion("op_OMP") and canOutskirts()
    elseif RegionOrder() then       return true and canOutskirts()
    elseif RegionNothing() then     return true and canOutskirts()
    else                            return false and canOutskirts()
    end
end


function canDarkhouseDepths()
    if RegionSanityProgOrder() then return has("depths") and canReachRegionOrder("op_ODD", true, true) and canGeode()
    elseif RegionSanityOrder() then return has("depths") and canReachRegionOrder("op_ODD", true, false) and canGeode()
    elseif RegionSanityProg() then  return has("depths") and has("progressive_area_witch", 1) and canGeode()
    elseif RegionSanity() then      return has("depths") and canGeode()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_ODD", false, true) and canGeode()
    elseif RegionProg() then        return has("progressive_area_witch", 1) and canGeode()
    elseif RegionOrder() then       return true and canGeode()
    elseif RegionNothing() then     return true and canGeode()
    else                            return false and canGeode()
    end
end

function canAtelierAurum()
    if RegionSanityProgOrder() then return has("atelier") and canReachRegionOrder("op_OAA", true, true) and canGeode()
    elseif RegionSanityOrder() then return has("atelier") and canReachRegionOrder("op_OAA", true, false) and canGeode()
    elseif RegionSanityProg() then  return has("atelier") and has("progressive_area_witch", 1) and canGeode()
    elseif RegionSanity() then      return has("atelier") and canGeode()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OAA", false, true) and canGeode()
    elseif RegionProg() then        return has("progressive_area_witch", 1) and canGeode()
    elseif RegionOrder() then       return true and canGeode()
    elseif RegionNothing() then     return true and canGeode()
    else                            return false and canGeode()
    end
end

function canSubterraSanctum()
    if RegionSanityProgOrder() then return has("sanctum") and canReachRegionOrder("op_OAA", true, true) and canGeode()
    elseif RegionSanityOrder() then return has("sanctum") and canReachRegionOrder("op_OAA", true, false) and canGeode()
    elseif RegionSanityProg() then  return has("sanctum") and has("progressive_area_witch", 1) and canGeode()
    elseif RegionSanity() then      return has("sanctum") and canGeode()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OEL", false, true) and canGeode()
    elseif RegionProg() then        return has("progressive_area_witch", 1) and canGeode()
    elseif RegionOrder() then       return true and canGeode()
    elseif RegionNothing() then     return true and canGeode()
    else                            return false and canGeode()
    end
end

function canLoopingHallway()
    if RegionSanityProgOrder() then return has("looping") and canReachRegionOrder("op_OLH", true, true) and canGeode()
    elseif RegionSanityOrder() then return has("looping") and canReachRegionOrder("op_OLH", true, false) and canGeode()
    elseif RegionSanityProg() then  return has("looping") and canReachHallway() and hasEnoughProgRegion("op_OLH") and canGeode()
    elseif RegionSanity() then      return has("looping") and canReachHallway() and canGeode()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_OLH", false, true) and canGeode()
    elseif RegionProg() then        return hasEnoughProgRegion("op_OLH") and canGeode()
    elseif RegionOrder() then       return true and canGeode()
    elseif RegionNothing() then     return true and canGeode()
    else                            return false and canGeode()
    end
end

function canReflectingPool()
    if RegionSanityProgOrder() then return has("pool") and canReachRegionOrder("op_ORP", true, true) and canGeode()
    elseif RegionSanityOrder() then return has("pool") and canReachRegionOrder("op_ORP", true, false) and canGeode()
    elseif RegionSanityProg() then  return has("pool") and canReachPool() and hasEnoughProgRegion("op_ORP") and canGeode()
    elseif RegionSanity() then      return has("pool") and canReachPool() and canGeode()
    elseif RegionProgOrder() then   return canReachRegionOrder("op_ORP", false, true) and canGeode()
    elseif RegionProg() then        return hasEnoughProgRegion("op_ORP") and canGeode()
    elseif RegionOrder() then       return true and canGeode()
    elseif RegionNothing() then     return true and canGeode()
    else                            return false and canGeode()
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
    elseif RegionSanityOrder() then return canReachAny()
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
