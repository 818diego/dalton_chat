local function AddChatSuggestions(playerId)
    TriggerClientEvent('chat:addSuggestion', playerId, '/pid', 'Envía un mensaje con tu ID de personaje', {
        { name = "mensaje", help = "El mensaje que quieres enviar" }
    })
    TriggerClientEvent('chat:addSuggestion', playerId, '/me', 'Realiza una acción en tercera persona', {
        { name = "acción", help = "La acción que realizas" }
    })
    TriggerClientEvent('chat:addSuggestion', playerId, '/do', 'Describe una situación o estado en tercera persona', {
        { name = "descripción", help = "La descripción de la situación" }
    })
    TriggerClientEvent('chat:addSuggestion', playerId, '/dados', 'Tira un dado del 1 al 10')
    TriggerClientEvent('chat:addSuggestion', playerId, '/rp', 'Envía un mensaje de rol escrito (In Character)', {
        { name = "mensaje", help = "El mensaje de rol que quieres enviar" }
    })
    TriggerClientEvent('chat:addSuggestion', playerId, '/ooc', 'Envía un mensaje fuera de personaje (Out Of Character)',
        {
            { name = "mensaje", help = "El mensaje OOC que quieres enviar" }
        })
    TriggerClientEvent('chat:addSuggestion', playerId, '/msg', 'Envía un mensaje privado a otro jugador', {
        { name = "ID",      help = "ID del jugador" },
        { name = "mensaje", help = "El mensaje que quieres enviar" }
    })
    TriggerClientEvent('chat:addSuggestion', playerId, '/sapd', 'Envía un mensaje como SAPD (Solo policías)', {
        { name = "mensaje", help = "El mensaje que quieres enviar" }
    })
    TriggerClientEvent('chat:addSuggestion', playerId, '/lssd', 'Envía un mensaje como LSSD (Solo sheriffs)', {
        { name = "mensaje", help = "El mensaje que quieres enviar" }
    })
    TriggerClientEvent('chat:addSuggestion', playerId, '/ems', 'Envía un mensaje como EMS (Solo paramédicos)', {
        { name = "mensaje", help = "El mensaje que quieres enviar" }
    })
    TriggerClientEvent('chat:addSuggestion', playerId, '/cs', 'Envía un mensaje en el chat de staff (Solo staff)', {
        { name = "mensaje", help = "El mensaje que quieres enviar" }
    })
    TriggerClientEvent('chat:addSuggestion', playerId, '/rpol', 'Chat interno de la policía (SAPD y LSSD)', {
        { name = "mensaje", help = "El mensaje que quieres enviar" }
    })
    TriggerClientEvent('chat:addSuggestion', playerId, '/311', 'Chat entre servicios de emergencia (SAPD, LSSD y EMS)', {
        { name = "mensaje", help = "El mensaje que quieres enviar" }
    })
    TriggerClientEvent('chat:addSuggestion', playerId, '/911', 'Chat interno de EMS (Solo paramédicos)', {
        { name = "mensaje", help = "El mensaje que quieres enviar" }
    })
end

AddEventHandler('playerJoining', function()
    local playerId = source
    AddChatSuggestions(playerId)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        local players = GetPlayers()
        for _, playerId in ipairs(players) do
            AddChatSuggestions(tonumber(playerId))
        end
    end
end)

AddEventHandler('QBCore:Server:PlayerLoaded', function(Player)
    AddChatSuggestions(Player.PlayerData.source)
end)

RegisterCommand('pid', function(source, args, rawCommand)
    local message = table.concat(args, " ")
    if message == "" then
        TriggerClientEvent('chat:addMessage', source, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">Debes proporcionar un texto para usar este comando.</span></div>'
        })
        return
    end
    exports['chat']:sendFormattedMessage(source, "PID", message)
end, false)

RegisterCommand('me', function(source, args, rawCommand)
    local message = table.concat(args, " ")
    if message == "" then
        TriggerClientEvent('chat:addMessage', source, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">Debes proporcionar un texto para usar este comando.</span></div>'
        })
        return
    end
    exports['chat']:sendFormattedMessage(source, "ME", " " .. message, 10.0)
end, false)

RegisterCommand('do', function(source, args, rawCommand)
    local message = table.concat(args, " ")
    if message == "" then
        TriggerClientEvent('chat:addMessage', source, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">Debes escribir un texto narrativo después de /do.</span></div>'
        })
        return
    end
    exports['chat']:sendFormattedMessage(source, "DO", " " .. message, 10.0)
end, false)

RegisterCommand('dados', function(source, args, rawCommand)
    local Player = exports.qbx_core:GetPlayer(source)
    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local characterName = firstName .. " " .. lastName
    local roll = math.random(1, 10)
    local message = characterName .. " tiró los dados 🎲 y obtuvo un " .. roll
    exports['chat']:sendFormattedMessage(source, "DADOS", message, 10.0)
end, false)

RegisterCommand('rp', function(source, args, rawCommand)
    local message = table.concat(args, " ")
    if message == "" then
        TriggerClientEvent('chat:addMessage', source, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">Debes proporcionar un texto para usar este comando.</span></div>'
        })
        return
    end
    local Player = exports.qbx_core:GetPlayer(source)
    local firstName = Player.PlayerData.charinfo.firstname
    local lastName = Player.PlayerData.charinfo.lastname
    local characterName = firstName .. " " .. lastName
    local formattedMessage =
        '<span style="background-color: rgba(0, 0, 0, 0.3); padding: 0px 5px 0px 5px; border-radius: 2px; font-style: italic;">' ..
        characterName .. ' dice</span>: ' .. message
    exports['chat']:sendFormattedMessage(source, "RP - IC", formattedMessage, 15.0)
end, false)

RegisterCommand('ooc', function(source, args, rawCommand)
    local message = table.concat(args, " ")
    if message == "" then
        TriggerClientEvent('chat:addMessage', source, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">Debes escribir un mensaje para usar el chat OOC.</span></div>'
        })
        return
    end
    exports['chat']:sendFormattedMessage(source, "OOC", message, 15.0)
end, false)

RegisterCommand('msg', function(source, args, rawCommand)
    if #args < 2 then
        TriggerClientEvent('chat:addMessage', source, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">Uso: /msg [ID] [mensaje]</span></div>'
        })
        return
    end
    local targetId = tonumber(args[1])
    if not targetId then
        TriggerClientEvent('chat:addMessage', source, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">La ID debe ser un número.</span></div>'
        })
        return
    end
    if GetPlayerName(targetId) == nil then
        TriggerClientEvent('chat:addMessage', source, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">No se encontró ningún jugador con esa ID.</span></div>'
        })
        return
    end
    table.remove(args, 1)
    local message = table.concat(args, " ")
    exports['chat']:sendPrivateMessage(source, targetId, message)
end, false)

RegisterCommand('sapd', function(source, args, rawCommand)
    local playerId = source
    local Player = exports.qbx_core:GetPlayer(source)
    if not Player then return end
    if Player.PlayerData.job.name ~= "police" then
        TriggerClientEvent('chat:addMessage', playerId, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">No tienes permiso para usar este comando.</span></div>'
        })
        return
    end
    local message = table.concat(args, " ")
    if message == "" then
        TriggerClientEvent('chat:addMessage', playerId, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">Debes proporcionar un texto para usar este comando.</span></div>'
        })
        return
    end
    local formattedMessage = string.format(message)
    exports['chat']:sendFormattedMessage(source, "SAPD", formattedMessage)
end, false)

RegisterCommand('lssd', function(source, args, rawCommand)
    local playerId = source
    local Player = exports.qbx_core:GetPlayer(source)
    if not Player then return end
    if Player.PlayerData.job.name ~= "sherrif" then
        TriggerClientEvent('chat:addMessage', playerId, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">No tienes permiso para usar este comando.</span></div>'
        })
        return
    end
    local message = table.concat(args, " ")
    if message == "" then
        TriggerClientEvent('chat:addMessage', playerId, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">Debes proporcionar un texto para usar este comando.</span></div>'
        })
        return
    end
    local formattedMessage = string.format(message)
    exports['chat']:sendFormattedMessage(source, "LSSD", formattedMessage)
end, false)

RegisterCommand('ems', function(source, args, rawCommand)
    local playerId = source
    local Player = exports.qbx_core:GetPlayer(source)
    if not Player then return end
    if Player.PlayerData.job.name ~= "ambulance" then
        TriggerClientEvent('chat:addMessage', playerId, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">No tienes permiso para usar este comando.</span></div>'
        })
        return
    end
    local message = table.concat(args, " ")
    if message == "" then
        TriggerClientEvent('chat:addMessage', playerId, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">Debes proporcionar un texto para usar este comando.</span></div>'
        })
        return
    end
    local formattedMessage = string.format(message)
    exports['chat']:sendFormattedMessage(source, "EMS", formattedMessage)
end, false)

RegisterCommand('cs', function(source, args, rawCommand)
    local playerId = source
    if not (IsPlayerAceAllowed(playerId, "admin") or IsPlayerAceAllowed(playerId, "mod") or IsPlayerAceAllowed(playerId, "support")) then
        TriggerClientEvent('chat:addMessage', playerId, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">No tienes permiso para usar el chat de staff.</span></div>'
        })
        return
    end
    local message = table.concat(args, " ")
    if message == "" then
        TriggerClientEvent('chat:addMessage', playerId, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">Debes proporcionar un texto para usar este comando.</span></div>'
        })
        return
    end
    local senderRank = "Staff"
    if IsPlayerAceAllowed(playerId, "admin") then
        senderRank = "Admin"
    elseif IsPlayerAceAllowed(playerId, "mod") then
        senderRank = "Mod"
    elseif IsPlayerAceAllowed(playerId, "support") then
        senderRank = "Support"
    end
    local formattedMessage = GetPlayerName(source) .. ": " .. message
    local players = GetPlayers()
    local staffPlayers = {}
    for _, playerID in ipairs(players) do
        playerID = tonumber(playerID)
        if IsPlayerAceAllowed(playerID, "admin") or IsPlayerAceAllowed(playerID, "mod") or IsPlayerAceAllowed(playerID, "support") then
            table.insert(staffPlayers, playerID)
        end
    end
    exports['chat']:sendFormattedMessage(source, "STAFF", formattedMessage, nil, staffPlayers)
end, false)

RegisterCommand('rpol', function(source, args, rawCommand)
    local playerId = source
    local Player = exports.qbx_core:GetPlayer(source)
    if not Player then return end
    if Player.PlayerData.job.name ~= "police" and Player.PlayerData.job.name ~= "sherrif" then
        TriggerClientEvent('chat:addMessage', playerId, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">No tienes permiso para usar este comando.</span></div>'
        })
        return
    end
    local message = table.concat(args, " ")
    if message == "" then
        TriggerClientEvent('chat:addMessage', playerId, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">Debes proporcionar un texto para usar este comando.</span></div>'
        })
        return
    end
    local senderPlayer = Player
    local lastName = senderPlayer.PlayerData.charinfo.lastname
    local jobGrade = senderPlayer.PlayerData.job.grade.name
    local formattedMessage =
        '<span style="background-color: rgba(0, 0, 0, 0.3); padding: 0px 5px 0px 5px; border-radius: 2px;">' ..
        jobGrade .. ' ' .. lastName .. '</span> : ' .. message
    local players = GetPlayers()
    local policeTargets = {}
    for _, playerID in ipairs(players) do
        playerID = tonumber(playerID)
        local targetPlayer = exports.qbx_core:GetPlayer(playerID)
        if targetPlayer and (targetPlayer.PlayerData.job.name == "police" or targetPlayer.PlayerData.job.name == "sherrif") then
            table.insert(policeTargets, playerID)
        end
    end
    exports['chat']:sendFormattedMessage(source, "SAPD-INTERNO", formattedMessage, nil, policeTargets)
end, false)

RegisterCommand('222', function(source, args, rawCommand)
    local playerId = source
    local Player = exports.qbx_core:GetPlayer(source)
    if not Player then return end
    if Player.PlayerData.job.name ~= "police" and Player.PlayerData.job.name ~= "sherrif" and Player.PlayerData.job.name ~= "ambulance" then
        TriggerClientEvent('chat:addMessage', playerId, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">No tienes permiso para usar este comando.</span></div>'
        })
        return
    end
    local message = table.concat(args, " ")
    if message == "" then
        TriggerClientEvent('chat:addMessage', playerId, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">Debes proporcionar un texto para usar este comando.</span></div>'
        })
        return
    end
    local senderPlayer = Player
    local lastName = senderPlayer.PlayerData.charinfo.lastname
    local jobGrade = senderPlayer.PlayerData.job.grade.name
    local department = ""
    if Player.PlayerData.job.name == "police" then
        department = "SAPD"
    elseif Player.PlayerData.job.name == "sherrif" then
        department = "LSSD"
    elseif Player.PlayerData.job.name == "ambulance" then
        department = "EMS"
    end
    local formattedMessage =
        '<span style="background-color: rgba(0, 0, 0, 0.3); padding: 0px 5px 0px 5px; border-radius: 2px; font-style: italic;">' ..
        department .. ' - ' .. jobGrade .. ' ' .. lastName .. '</span> : ' .. message
    local players = GetPlayers()
    local emergencyTargets = {}
    for _, playerID in ipairs(players) do
        playerID = tonumber(playerID)
        local targetPlayer = exports.qbx_core:GetPlayer(playerID)
        if targetPlayer and (targetPlayer.PlayerData.job.name == "police" or targetPlayer.PlayerData.job.name == "sherrif" or targetPlayer.PlayerData.job.name == "ambulance") then
            table.insert(emergencyTargets, playerID)
        end
    end
    exports['chat']:sendFormattedMessage(source, "EMERGENCIAS-311", formattedMessage, nil, emergencyTargets)
end, false)

RegisterCommand('rems', function(source, args, rawCommand)
    local playerId = source
    local Player = exports.qbx_core:GetPlayer(source)
    if not Player then return end
    if Player.PlayerData.job.name ~= "ambulance" then
        TriggerClientEvent('chat:addMessage', playerId, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">No tienes permiso para usar este comando.</span></div>'
        })
        return
    end
    local message = table.concat(args, " ")
    if message == "" then
        TriggerClientEvent('chat:addMessage', playerId, {
            template =
            '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">Debes proporcionar un texto para usar este comando.</span></div>'
        })
        return
    end
    local senderPlayer = Player
    local lastName = senderPlayer.PlayerData.charinfo.lastname
    local jobGrade = senderPlayer.PlayerData.job.grade.name
    local formattedMessage =
        '<span style="background-color: rgba(0, 0, 0, 0.3); padding: 0px 5px 0px 5px; border-radius: 2px; font-style: italic;">' ..
        jobGrade .. ' ' .. lastName .. '</span> : ' .. message
    local players = GetPlayers()
    local emsTargets = {}
    for _, playerID in ipairs(players) do
        playerID = tonumber(playerID)
        local targetPlayer = exports.qbx_core:GetPlayer(playerID)
        if targetPlayer and targetPlayer.PlayerData.job.name == "ambulance" then
            table.insert(emsTargets, playerID)
        end
    end
    exports['chat']:sendFormattedMessage(source, "EMS-INTERNO", formattedMessage, nil, emsTargets)
end, false)
