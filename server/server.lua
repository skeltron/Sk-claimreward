local file = LoadResourceFile(GetCurrentResourceName(), 'claimed.json')
local data = file and json.decode(file) or {}

local function getLicense(source)
    for _, id in ipairs(GetPlayerIdentifiers(source)) do
        if id:sub(1,8) == "license:" then
            return id
        end
    end
    return nil
end

RegisterCommand('claimreward', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local license = getLicense(source)
    if not license then
        print('[CLAIMREWARD-BEVEILIGING] Speler zonder license probeerde een reward te claimen')
        return
    end

    if data[license] then
        xPlayer.showNotification("Je hebt dit al geclaimed!")
        return
    end

    data[license] = true
    SaveResourceFile(GetCurrentResourceName(), 'claimed.json', json.encode(data), -1)

    xPlayer.addAccountMoney("bank", 100000)
    xPlayer.showNotification("Je hebt €100.000 ontvangen!")

    print(('[CLAIM] %s (%s) heeft succesvol een reward geclaimed'):format(
        xPlayer.getName(),
        license
    ))
end, false)
