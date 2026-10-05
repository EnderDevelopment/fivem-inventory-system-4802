local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Get player inventory
ESX.RegisterServerCallback('inventory:getInventory', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local inventory = xPlayer.getInventory()
        cb(inventory)
    else
        cb(nil)
    end
end)

-- Use item
RegisterServerEvent('inventory:useItem')
AddEventHandler('inventory:useItem', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        -- Implement item usage logic here
        xPlayer.showNotification('Used ' .. item)
    end
end)

-- Drop item
RegisterServerEvent('inventory:dropItem')
AddEventHandler('inventory:dropItem', function(item, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        -- Implement item drop logic here
        xPlayer.showNotification('Dropped ' .. count .. ' ' .. item)
    end
end)

-- Move item
RegisterServerEvent('inventory:moveItem')
AddEventHandler('inventory:moveItem', function(fromSlot, toSlot, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        -- Implement item move logic here
        xPlayer.showNotification('Moved ' .. count .. ' items from slot ' .. fromSlot .. ' to slot ' .. toSlot)
    end
end)