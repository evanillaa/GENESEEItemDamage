local QBCore = exports['qb-core']:GetCoreObject()

local cooldown = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        for k, v in pairs(cooldown) do
            if v > 0 then
                cooldown[k] = v - 1
            end
        end
    end
end)

RegisterNetEvent('GENESEE:ItemDamage', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local PlayerC = QBCore.Functions.GetPlayer(src).PlayerData.name

    local items = QBCore.Functions.GetPlayer(src).PlayerData.items

    for a, b in pairs(Config.itemList) do
        local Item = b.item
        local Damage = b.damageItem

        local percent = 0

        for c, d in pairs(items) do

            if Item == d.name then
                local Item = b.item

                Player.Functions.RemoveItem(Item, 1)
                Player.Functions.AddItem(Damage, 1, nil)
                print("Seu item queimou!")
                return true

            end

            if Damage == nil then
                if cooldown[PlayerC] == 0 or not cooldown[PlayerC] then
                    cooldown[PlayerC] = 5

                    percent = math.random(100)

                    if percent >= 60 then

                        if Item == d.name then
                            Player.Functions.RemoveItem(Item, 1)
                            print("mochila aberta, seu item molhou")

                            percent = 0
                            return true
                        end
                    end
                else
                    return false
                end
            end
        end
    end
end)
