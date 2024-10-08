local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    local HungerWarning, VeryHungryWarning, ThirstWarning, VeryThirstWarning = false, false, false, false

    while true do
        if Config.Framework == "esx" then
            TriggerEvent('esx_status:getStatus', 'hunger', function(status)
                if status.val < 300000 then
                    if not HungerWarning then
                        Notify(Config.Lang.hungry, "fa-solid fa-burger", "#FF8733", 5000)
                        HungerWarning = true
                    end
                else
                    HungerWarning = false
                end
                if status.val < 100000 then
                    if not VeryHungryWarning then
                        Notify(Config.Lang.veryhungry, "fa-solid fa-burger", "#FF8733", 5000)
                        VeryHungryWarning = true
                    end
                else
                    VeryHungryWarning = false
                end
            end)

            TriggerEvent('esx_status:getStatus', 'thirst', function(status)
                if status.val < 300000 then
                    if not ThirstWarning then
                        Notify(Config.Lang.thirsty, "fa-solid fa-glass-water", "#0E86CC", 5000)
                        ThirstWarning = true
                    end
                else
                    ThirstWarning = false
                end
                if status.val < 100000 then
                    if not VeryThirstWarning then
                        Notify(Config.Lang.verythirsty, "fa-solid fa-glass-water", "#0E86CC", 5000)
                        VeryThirstWarning = true
                    end
                else
                    VeryThirstWarning = false
                end
            end)

        elseif Config.Framework == "qbcore" then
            local playerData = QBCore.Functions.GetPlayerData()
            local hunger = playerData.metadata["hunger"]
            local thirst = playerData.metadata["thirst"]

            if hunger < 30 then
                if not HungerWarning then
                    Notify(Config.Lang.hungry, "fa-solid fa-burger", "#FF8733", 5000)
                    HungerWarning = true
                end
            else
                HungerWarning = false
            end

            if hunger < 10 then
                if not VeryHungryWarning then
                    Notify(Config.Lang.veryhungry, "fa-solid fa-burger", "#FF8733", 5000)
                    VeryHungryWarning = true
                end
            else
                VeryHungryWarning = false
            end

            if thirst < 30 then
                if not ThirstWarning then
                    Notify(Config.Lang.thirsty, "fa-solid fa-glass-water", "#0E86CC", 5000)
                    ThirstWarning = true
                end
            else
                ThirstWarning = false
            end

            if thirst < 10 then
                if not VeryThirstWarning then
                    Notify(Config.Lang.verythirsty, "fa-solid fa-glass-water", "#0E86CC", 5000)
                    VeryThirstWarning = true
                end
            else
                VeryThirstWarning = false
            end
        end

        Wait(Config.TimeBetweenChecking * 1000)
    end
end)

