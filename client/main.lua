local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    while true do
        local idle = 1000
        local ped = PlayerPedId()

        if IsEntityInWater(ped) then
            idle = 100
            if IsPedSwimming(ped) and not IsPedSwimmingUnderWater(ped) then
                TriggerServerEvent('GENESEE:ItemDamage')
            end
            if IsPedSwimming(ped) and IsPedSwimmingUnderWater(ped) then
                TriggerServerEvent('GENESEE:ItemDamage')
            end
        end
        Citizen.Wait(idle)
    end
end)
