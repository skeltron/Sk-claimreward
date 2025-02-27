local file = LoadResourceFile(GetCurrentResourceName(), 'claimed.json')
local data = json.decode(file)

RegisterCommand('claimreward', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
    local license

    for k, v in ipairs(GetPlayerIdentifiers(source)) do
        if string.match(v, "license:") then
            license = v
            break
        end
    end

    if not data[license] then
        data[license] = true
        SaveResourceFile(GetCurrentResourceName(), 'claimed.json', json.encode(data), -1)
		xPlayer.showNotification("Je hebt 100K ontvangen!")
        xPlayer.addAccountMoney("bank", 100000)
    else
        xPlayer.showNotification("Je hebt dit al geclaimed!")
    end
end, false)