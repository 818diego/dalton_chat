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

RegisterCommand('ooc', function(source, args, rawCommand)
    local message = table.concat(args, " ")
    if message == "" then
        TriggerClientEvent('chat:addMessage', source, {
            template = '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">Debes escribir un mensaje para usar el chat OOC.</span></div>'
        })
        return
    end
    exports['chat']:sendFormattedMessage(source, "OOC", message, 15.0)
end, false)

RegisterCommand('msg', function(source, args, rawCommand)
    if #args < 2 then
        TriggerClientEvent('chat:addMessage', source, {
            template = '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">Uso: /msg [ID] [mensaje]</span></div>'
        })
        return
    end
    local targetId = tonumber(args[1])
    if not targetId then
        TriggerClientEvent('chat:addMessage', source, {
            template = '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">La ID debe ser un número.</span></div>'
        })
        return
    end
    if GetPlayerName(targetId) == nil then
        TriggerClientEvent('chat:addMessage', source, {
            template = '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">No se encontró ningún jugador con esa ID.</span></div>'
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
    if Player.PlayerData.job.name ~= "police"  then
        TriggerClientEvent('chat:addMessage', playerId, {
            template = '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">No tienes permiso para usar este comando.</span></div>'
        })
        return
    end
    local message = table.concat(args, " ")
    if message == "" then
        TriggerClientEvent('chat:addMessage', playerId, {
            template = '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">Debes proporcionar un texto para usar este comando.</span></div>'
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
    if Player.PlayerData.job.name ~= "sherrif"  then
        TriggerClientEvent('chat:addMessage', playerId, {
            template = '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">No tienes permiso para usar este comando.</span></div>'
        })
        return
    end
    local message = table.concat(args, " ")
    if message == "" then
        TriggerClientEvent('chat:addMessage', playerId, {
            template = '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">Debes proporcionar un texto para usar este comando.</span></div>'
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
    if Player.PlayerData.job.name ~= "ambulance"  then
        TriggerClientEvent('chat:addMessage', playerId, {
            template = '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">No tienes permiso para usar este comando.</span></div>'
        })
        return
    end
    local message = table.concat(args, " ")
    if message == "" then
        TriggerClientEvent('chat:addMessage', playerId, {
            template = '<div style="display: flex; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 0.5vw; padding: 0.7vw; font-size: 15px;"><span style="color: white;">ERROR:</span> <span style="color: white; padding-left: 0.5vw;">Debes proporcionar un texto para usar este comando.</span></div>'
        })
        return
    end
    local formattedMessage = string.format(message)
    exports['chat']:sendFormattedMessage(source, "EMS", formattedMessage)
end, false)