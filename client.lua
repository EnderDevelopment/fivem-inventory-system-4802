local ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

-- Open inventory
RegisterCommand('inventory', function()
    ESX.TriggerServerCallback('inventory:getInventory', function(inventory)
        if inventory then
            -- Open inventory UI with the data
            SendNUIMessage({
                action = 'openInventory',
                inventory = inventory
            })
        else
            ESX.ShowNotification('Failed to load inventory.')
        end
    end)
end, false)

-- Handle item usage
RegisterNUICallback('useItem', function(data, cb)
    TriggerServerEvent('inventory:useItem', data.item)
    cb('ok')
end)

-- Handle item drop
RegisterNUICallback('dropItem', function(data, cb)
    TriggerServerEvent('inventory:dropItem', data.item, data.count)
    cb('ok')
end)

-- Handle item move
RegisterNUICallback('moveItem', function(data, cb)
    TriggerServerEvent('inventory:moveItem', data.fromSlot, data.toSlot, data.count)
    cb('ok')
end)