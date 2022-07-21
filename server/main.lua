local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('voting:server:checkIfVoted', function(source, cb)
  local cid = QBCore.Functions.GetPlayer(source).PlayerData.citizenid
  local hasVoted = MySQL.Sync.fetchScalar('SELECT hasvoted FROM players WHERE citizenid = ? LIMIT 1', {cid})
  if hasVoted == 1 then
    cb(true)
  else
    cb(false)
  end
end)

RegisterNetEvent('voting:server:castVote', function(data)
  local _s = source
  local cid = QBCore.Functions.GetPlayer(_s).PlayerData.citizenid
  MySQL.update('UPDATE players SET hasvoted = ? WHERE citizenid = ?', {1, cid})

  local result = MySQL.Sync.fetchAll('SELECT votes FROM election WHERE name = ?', { data.vote.name })

  if not result[1] then
      MySQL.insert('INSERT INTO election (name, party, votes) VALUES (?, ?, ?)',{ data.vote.name, data.vote.party, 1 })
  else
      MySQL.update("UPDATE election SET votes=? WHERE name=?;", { result[1].votes+1, data.vote.name })
  end
end)

QBCore.Commands.Add("checkvotes", 'Check votes', {}, false, function(source)
	local src = source
    local result = MySQL.Sync.fetchAll('SELECT * FROM election')
    
    local menu = {
        {
            header = "Candidates",
            isMenuHeader = true
        }
    }

    for k, v in pairs(result) do
        menu[#menu+1] = {
            header = v.name..' - '..v.party,
            txt = 'Votes: '..v.votes,
        }
    end

    TriggerClientEvent('qb-menu:client:openMenu', source, menu)
end, "admin")
