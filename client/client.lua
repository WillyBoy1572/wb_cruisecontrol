local cruiseEnabled = false

if Config.Speed  == "km" then
    speed = 3.6
else
    speed = 2.237
end

if Config.Command then
    RegisterNetEvent('wd_cruiseControl:cruiserCar')
    AddEventHandler('wd_cruiseControl:cruiserCar', function(cruiserSpeed, cruiserNotification)
        local ped = PlayerPedId()
        local inVehicle = IsPedSittingInAnyVehicle(ped)
        local vehicle = GetVehiclePedIsIn(ped, false)

        Wait(250)

        if not inVehicle then
            lib.notify({
                title = 'Voiture',
                description = 'Aucun vehicule trouver',
                position = 'top',
                type = 'error'
            })
        end

        if not (GetPedInVehicleSeat(vehicle, -1) == ped ) then
            lib.notify({
                title = 'Voiture',
                description = 'Vous devez être conducteur',
                position = 'top',
                type = 'error'
            })
        end

        SetEntityMaxSpeed(vehicle, cruiserSpeed)
        cruiseEnabled = true
        lib.notify({
            title = 'Voiture',
            description = 'Vous avez activer le cruise',
            position = 'top',
            type = 'success'
        })
    end)

    RegisterCommand(Config.OffCruiseCommand, function()
        local ped = PlayerPedId() -- Ped
        local inVehicle = IsPedSittingInAnyVehicle(ped)
        local vehicle = GetVehiclePedIsIn(ped, false)
        local maxSpeed = GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel")

        Wait(250)

        if not inVehicle then
            ib.notify({
                title = 'Voiture',
                description = 'Aucun vehicule trouver',
                position = 'top',
                type = 'error'
            })
        end

        if not (GetPedInVehicleSeat(vehicle, -1) == ped ) then
            lib.notify({
                title = 'Voiture',
                description = 'Vous devez être conducteur',
                position = 'top',
                type = 'error'
            })
        end
        
        SetEntityMaxSpeed(vehicle, maxSpeed)
        cruiseEnabled = false
        lib.notify({
            title = 'Voiture',
            description = 'Vous avez desactiver le cruise',
            position = 'top',
            type = 'inform'
        })
    end)
end


if Config.KeyMap then

    RegisterCommand("+activatecruiser", function()
        local ped = PlayerPedId() -- Ped
        local inVehicle = IsPedSittingInAnyVehicle(ped)
        local vehicle = GetVehiclePedIsIn(ped, false)
        local maxSpeed = GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel")
        local cruiserSpeed = GetEntitySpeed(vehicle)

        Wait(250)

        if not inVehicle then
            return
        end

        if not (GetPedInVehicleSeat(vehicle, -1) == ped ) then
            return
        end

        if not cruiseEnabled then
            SetEntityMaxSpeed(vehicle, cruiserSpeed)
            cruiserNotification = math.floor(cruiserSpeed * speed + 0.5)
            cruiseEnabled = true
            lib.notify({
                title = 'Voiture',
                description = 'Vous avez activer le cruise',
                position = 'top',
                type = 'success'
            })
         else
            SetEntityMaxSpeed(vehicle, maxSpeed)
            cruiseEnabled = false
            lib.notify({
                title = 'Voiture',
                description = 'Vous avez desactiver le cruise',
                position = 'top',
                type = 'inform'
            })
         end
    end)

    RegisterKeyMapping('+activatecruiser', 'Cruise Control', 'keyboard', Config.KeyBind)

end

RegisterNetEvent('wd_cruiseControl:Notify')
AddEventHandler('wd_cruiseControl:Notify', function(msg)
    SetTextFont(0)
    SetNotificationTextEntry('STRING')
    AddTextComponentSubstringPlayerName(msg)
    DrawNotification(false, true)
end)
