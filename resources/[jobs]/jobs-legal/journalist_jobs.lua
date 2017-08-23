Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, -391.77563476563, -1879.1479492188, 20.527830123901, true)
    if not IsInVehicle() then
      if distance < 5 then
        if camionSortie == false then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~obtenir votre véhicule~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
            if myjob == 21 then
                local car = GetHashKey("rumpoa")
                RequestModel(car)
                while not HasModelLoaded(car) do
                  Wait(1)
                end
                vehicle =  CreateVehicle(car, -391.77563476563, -1879.1479492188, 20.527830123901, 0.0, true, false)		
                MISSION.truck = vehicle
                SetVehicleOnGroundProperly(vehicle)
        				SetVehicleNumberPlateText(vehicle, job.plate)
        				Wait(100)
        				SetVehicleHasBeenOwnedByPlayer(vehicle,true)
                SetVehRadioStation(vehicle, "OFF")
                SetVehicleLivery(vehicle, 4)
                SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
                SetVehicleEngineOn(vehicle, true, false, false)
                SetEntityAsMissionEntity(vehicle, true, true)
                Wait(100)
                Citizen.Wait(1)
                camionSortie = true
				onJobLegal = 1
			else
              TriggerEvent("itinerance:notif", "~r~Vous devez être journaliste !")
            end
          end
        else
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~ranger votre véhicule~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            if myjob == 21 then
              camionSortie = false
			  onJobLegal = 2
            end
          end
        end
      end
    end
end
end)

local DrawMarkerShow = true

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
    if DrawMarkerShow then
    DrawMarker(1, -391.77563476563, -1879.1479492188, 19.527830123901, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 0, 255, 75, 0, 0, 2, 0, 0, 0, 0)
    DrawMarker(1, -398.56356811523, -1885.6760253906, 20.539499282837, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
    DrawMarker(1, -223.96334838867, -2002.7076416016, 23.68529510498, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, -398.56356811523, -1885.6760253906, 21.539499282837, true)
    if not IsInVehicle() then
      if distance < 2 then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~aller au studio~w~.', 0)
          if IsControlJustPressed(1,38) then
            Wait(200)
            Citizen.Wait(1)
      SetEntityCoords(GetPlayerPed(-1), -223.96334838867, -2002.7076416016, 24.68529510498)
      SetEntityHeading(GetPlayerPed(-1), 170.0)
          end
      end
    end
end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, -223.96334838867, -2002.7076416016, 24.68529510498, true)
    if not IsInVehicle() then
      if distance < 2 then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~sortir du studio~w~.', 0)
          if IsControlJustPressed(1,38) then
            Wait(200)
            Citizen.Wait(1)
      SetEntityCoords(GetPlayerPed(-1), -398.56356811523, -1885.6760253906, 21.539499282837)
      SetEntityHeading(GetPlayerPed(-1), 170.0)
          end
      end
    end
end
end)