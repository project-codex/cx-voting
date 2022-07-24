local QBCore = exports['qb-core']:GetCoreObject()
local hasVoted = false
local votingComboZone = {}
local inZone = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    -- This sens the UI store the information about the candidates from config.lua
    local after = {}
    for k, v in pairs(Config.Candidates) do
        after[#after + 1] = {
            name = v.name,
            party = v.party
        }
    end
    SendNUIMessage({
        action = 'sendData',
        data = after
    })

    -- This creates the combozone needed for checking if player can vote or not
    local zones = {}
    for k, v in pairs(Config.VotingBooths) do
        zones[#zones + 1] = BoxZone:Create(vector3(v.x, v.y, v.z), 1.0, 1.0, {
            name = 'votingZone',
            heading = v.w,
            -- debugPoly = true
        })
    end
    votingComboZone = ComboZone:Create(zones, {
        name = "votingBoothZones",
    })
    votingComboZone:onPlayerInOut(function(isPointInside, point)
        if isPointInside then
            exports['qb-core']:DrawText('[E] Vote', 'left')
            inZone = true
            TriggerEvent('voting:client:showNui')
        else
            exports['qb-core']:HideText()
            inZone = false
        end
    end)
end)

RegisterNetEvent('voting:client:showNui', function()
    while true do
        if not inZone then break end
        if IsControlJustReleased(0, 38) then
            QBCore.Functions.TriggerCallback('voting:server:checkIfVoted', function(hasVoted)
                if not hasVoted then
                    SendNUIMessage({
                        action = 'setVisible',
                        data = true
                    })
                    SetNuiFocus(true, true)
                else
                    QBCore.Functions.Notify('You have already voted.', 'error')
                end
            end)
        end
        Wait(3)
    end
end)

RegisterNUICallback('hideUI', function(_, cb)
    SetNuiFocus(false, false)
end)

RegisterNUICallback('voting/castVote', function(data, cb)
    TriggerServerEvent('voting:server:castVote', data)
    cb({status='success'})
end)

RegisterCommand('svelte:send', function()
    local after = {}
    for k, v in pairs(Config.Candidates) do
        print(v.name)
        after[#after + 1] = {
            name = v.name,
            party = v.party
        }
    end
    SendNUIMessage({
        action = 'sendData',
        data = after
    })
end)
