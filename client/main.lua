local lastWeapon = nil
local lastVehicle = nil

CreateThread(function()
    while true do
        if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then
            -- in vehicle
            local currentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            if lastVehicle ~= currentVehicle then
                lastVehicle = currentVehicle
            end
        else
            if lastVehicle ~= 0 then
                SetCurrentPedWeapon(PlayerPedId(), lastWeapon, true)
            else
            end
            lastVehicle = nil
            -- not in vehicle
            local holdingWeapon, holdingWeaponHash = GetCurrentPedWeapon(PlayerPedId(), true)
            if holdingWeapon then
                if holdingWeaponHash ~= lastWeapon then
                    lastWeapon = holdingWeaponHash
                end
            end
        end

        Wait(1000)
    end
end)