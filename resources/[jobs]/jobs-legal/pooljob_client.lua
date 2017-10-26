local pool_locations = {
	{enteringpool = {722.0145,-909.5587,24.43356}, innutile2 = {722.0145,-909.5587,24.43356}, outsidepool= {717.3234,-894.7209,24.0391}},
}

local pool_blips ={}
local inrangeofpool= false
local inrangeofpool3 = false
local currentlocation = nil
local boughtcar = false

local function LocalPed()
	return GetPlayerPed(-1)
end

function drawTxtpool(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function IsPlayerInRangeOfpool()
	return inrangeofpool
end

function IsPlayerInRangeOfpool3()
	return inrangeofpool3
end

function ShowpoolBlips(bool)
	if bool and #pool_blips == 0 then
		for station,pos in pairs(pool_locations) do
			local loc = pos
			pos = pos.outsidepool
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
			-- 60 58 137
			SetBlipSprite(blip,85)
			SetBlipColour(blip, 57)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Piscine')
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			table.insert(pool_blips, {blip = blip, pos = loc})
		end
		Citizen.CreateThread(function()
			while #pool_blips > 0 do
				Citizen.Wait(0)
				local inrange = false
				local inrange3 = false
				for i,b in ipairs(pool_blips) do
					if IsPedInAnyVehicle(LocalPed(), true) == false and GetDistanceBetweenCoords(b.pos.enteringpool[1],b.pos.enteringpool[2],b.pos.enteringpool[3],GetEntityCoords(LocalPed()),true) > 0 then
						DrawMarker(0,711.4304,-893.3711,23.05157,0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
						currentlocation = b
						if GetDistanceBetweenCoords(711.4304,-893.3711,23.05157,GetEntityCoords(LocalPed()),true) < 3 then
							if onJobLegal == 0 then
								ShowInfoJobPool("Appuyez sur ~INPUT_CONTEXT~ pour ~b~sortir votre camion~w~.", 0)
							elseif onJobLegal == 1 then
								ShowInfoJobPool("Appuyez sur ~INPUT_CONTEXT~ pour ~b~ranger votre camion~w~.", 0)
							end
							inrange3 = true
						end
					end
				end
				inrangeofpool = inrange
				inrangeofpool3 = inrange3
			end
		end)
	elseif bool == false and #pool_blips > 0 then
		for i,b in ipairs(pool_blips) do
			if DoesBlipExist(b.blip) then
				SetBlipAsMissionCreatorBlip(b.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
			end
		end
		pool_blips = {}
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1,38) and inrangeofpool3 then
			TriggerServerEvent("poleemploi:getjobs")
			TriggerServerEvent("job:getCash_s")
			Wait(200)
			if myjob == 2 then
					if onJobLegal == 0 then
						if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then -- Male
							SetPedComponentVariation(GetPlayerPed(-1),11, 9, 4, 0)
							SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)
							SetPedComponentVariation(GetPlayerPed(-1), 6, 6, 0, 0)
							SetPedComponentVariation(GetPlayerPed(-1), 4, 6, 1, 0)
							SetPedComponentVariation(GetPlayerPed(-1), 3, 30, 0, 0)
						  elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then -- Female
							SetPedComponentVariation(GetPlayerPed(-1),11, 50, 0, 0)
							SetPedComponentVariation(GetPlayerPed(-1), 8, 9, 0, 0)
							SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)
							SetPedComponentVariation(GetPlayerPed(-1), 4, 49, 0, 0)
							SetPedComponentVariation(GetPlayerPed(-1), 3, 2, 0, 0)
						  end
							--TriggerServerEvent('CheckPoolVehi')
							--TriggerServerEvent('SetPlateJob')
							--local car = 0xC703DB5F
							Wait(100)
							local car = GetHashKey("utillitruck3")
							--local car = 0x58B3979C
							-- VOITURE PAR DÉFAUT
							local cplate = job.plate
							Citizen.CreateThread(function()
								Citizen.Wait(10)
								RequestModel(car)
								while not HasModelLoaded(car) do
									Citizen.Wait(0)
								end
								veh = CreateVehicle(car, 729.268, -878.351, 24.95, 0.0, true, false)
								MISSION.truck = veh
								Wait(100)
								SetEntityVelocity(veh, 2000)
								--SetVehicleNumberPlateText(veh, cplate)
								SetVehicleOnGroundProperly(veh)
								SetVehicleHasBeenOwnedByPlayer(veh,true)
								local id = NetworkGetNetworkIdFromEntity(veh)
								SetNetworkIdCanMigrate(id, true)
								SetVehRadioStation(veh, "OFF")
								SetVehicleColours(veh, 64,64)
								SetVehicleLivery(veh, 3)
								SetPedIntoVehicle(GetPlayerPed(-1),  veh,  -1)
								DrawNotif("Véhicule sorti, bonne route")
							end)
							inrangeofpool3 = false
							inrange3 = false
					elseif onJobLegal == 1 and EndingDay == false then
						EndingDay = true
						poolEnding()
						TriggerServerEvent("vmenu:lastChar")
					end
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez être nettoyeur de piscines !")
			end
		end
	end
end)

daily = {flag = {}, blip = {}, veh = {}, coords = {cx={}, cy={}, cz={}}}

function StartJobPool()
	showLoadingPromtpool("Chargement du métier...", 2000, 3)
	daily.coords.cx[1], daily.coords.cy[1], daily.coords.cz[1] = -738.929504394531,-1001.42248535156,18.1769104003906
	daily.coords.cx[2], daily.coords.cy[2], daily.coords.cz[2] = -1316.59814453125,-1048.72253417969,12.4786081314087
	daily.coords.cx[3], daily.coords.cy[3], daily.coords.cz[3] = -1349.1513671875,-928.871337890625,11.7529716491699
	daily.coords.cx[4], daily.coords.cy[4], daily.coords.cz[4] = 950.528198242188,-688.87255859375,57.5051918029785
	daily.coords.cx[5], daily.coords.cy[5], daily.coords.cz[5] = 917.773559570313,-654.479614257813,57.9147567749023
	daily.coords.cx[6], daily.coords.cy[6], daily.coords.cz[6] = -1660.48107910156,-421.920166015625,41.6179161071777
	daily.coords.cx[7], daily.coords.cy[7], daily.coords.cz[7] = 906.0537109375,-641.011352539063,58.0660133361816
	daily.coords.cx[8], daily.coords.cy[8], daily.coords.cz[8] = 877.856262207031,-617.921936035156,56.6520385742188
	daily.coords.cx[9], daily.coords.cy[9], daily.coords.cz[9] = 841.294250488281,-581.756225585938,57.2155075073242
	daily.coords.cx[10], daily.coords.cy[10], daily.coords.cz[10] = 827.415588378906,-532.004211425781,56.469123840332
	daily.coords.cx[11], daily.coords.cy[11], daily.coords.cz[11] = 852.127380371094,-500.040161132813,54.8360176086426
	daily.coords.cx[12], daily.coords.cy[12], daily.coords.cz[12] = -1860.73413085938,-350.519195556641,55.8096160888672
	daily.coords.cx[13], daily.coords.cy[13], daily.coords.cz[13] = 902.229919433594,-465.024230957031,59.0920791625977
	daily.coords.cx[14], daily.coords.cy[14], daily.coords.cz[14] = -1546.62854003906,-267.386596679688,46.7072334289551
	daily.coords.cx[15], daily.coords.cy[15], daily.coords.cz[15] = 917.226196289063,-461.550964355469,60.6280632019043
	daily.coords.cx[16], daily.coords.cy[16], daily.coords.cz[16] = -1536.68811035156,-113.272468566895,53.7628211975098
	daily.coords.cx[17], daily.coords.cy[17], daily.coords.cz[17] = 935.613708496094,-448.359924316406,61.2502975463867
	daily.coords.cx[18], daily.coords.cy[18], daily.coords.cz[18] = -1491.96154785156,-60.7673263549805,54.615852355957
	daily.coords.cx[19], daily.coords.cy[19], daily.coords.cz[19] = -1476.49975585938,10.6081628799438,54.0265998840332
	daily.coords.cx[20], daily.coords.cy[20], daily.coords.cz[20] = 954.409240722656,-437.870727539063,62.4910926818848
	daily.coords.cx[21], daily.coords.cy[21], daily.coords.cz[21] = -1538.25463867188,-4.20401763916016,56.4208221435547
	daily.coords.cx[22], daily.coords.cy[22], daily.coords.cz[22] = -1580.49780273438,4.59697198867798,60.8923759460449
	daily.coords.cx[23], daily.coords.cy[23], daily.coords.cz[23] = 1005.43011474609,-408.125579833984,64.4217300415039
	daily.coords.cx[24], daily.coords.cy[24], daily.coords.cz[24] = -1633.92993164063,-1.20869052410126,61.5918731689453
	daily.coords.cx[25], daily.coords.cy[25], daily.coords.cz[25] = -1478.93176269531,188.168075561523,56.6722755432129
	daily.coords.cx[26], daily.coords.cy[26], daily.coords.cz[26] = -1351.06921386719,345.849487304688,64.0796966552734
	daily.coords.cx[27], daily.coords.cy[27], daily.coords.cz[27] = -1201.46704101563,312.805389404297,69.457145690918
	daily.coords.cx[28], daily.coords.cy[28], daily.coords.cz[28] = -1156.6201171875,372.440368652344,69.3967132568359
	daily.coords.cx[29], daily.coords.cy[29], daily.coords.cz[29] = -1015.17376708984,218.781234741211,65.0348663330078
	daily.coords.cx[30], daily.coords.cy[30], daily.coords.cz[30] = -1004.45294189453,124.732749938965,55.6578636169434
	daily.coords.cx[31], daily.coords.cy[31], daily.coords.cz[31] = -897.607421875,99.3576049804688,54.9156227111816
	daily.coords.cx[32], daily.coords.cy[32], daily.coords.cz[32] = -887.100646972656,-41.2655944824219,38.2400054931641
	daily.coords.cx[33], daily.coords.cy[33], daily.coords.cz[33] = -552.524963378906,-780.969421386719,30.6982593536377
	daily.coords.cx[34], daily.coords.cy[34], daily.coords.cz[34] = -789.099731445313,-773.860229492188,27.8723220825195
	daily.coords.cx[35], daily.coords.cy[35], daily.coords.cz[35] = -303.476440429688,-1087.5947265625,30.385066986084
	daily.coords.cx[36], daily.coords.cy[36], daily.coords.cz[36] = 304.965698242188,461.374420166016,142.93147277832
	daily.coords.cx[37], daily.coords.cy[37], daily.coords.cz[37] = 152.631607055664,-266.453460693359,46.3132209777832
	daily.coords.cx[38], daily.coords.cy[38], daily.coords.cz[38] = 106.846817016602,-249.71354675293,47.4159736633301
	daily.coords.cx[39], daily.coords.cy[39], daily.coords.cz[39] = 78.3297348022461,-247.510314941406,48.1881980895996
	daily.coords.cx[40], daily.coords.cy[40], daily.coords.cz[40] = -7.55549907684326,-34.7861785888672,68.9975891113281
	daily.coords.cx[41], daily.coords.cy[41], daily.coords.cz[41] = 291.779205322266,498.020751953125,148.174057006836
	daily.coords.cx[42], daily.coords.cy[42], daily.coords.cz[42] = -59.1110610961914,106.590705871582,81.4988327026367
	daily.coords.cx[43], daily.coords.cy[43], daily.coords.cz[43] = -16.5135955810547,327.158050537109,113.160850524902
	daily.coords.cx[44], daily.coords.cy[44], daily.coords.cz[44] = 510.74951171875,220.847747802734,104.744125366211
	daily.coords.cx[45], daily.coords.cy[45], daily.coords.cz[45] = 301.10009765625,528.569213867188,152.61701965332
	daily.coords.cx[46], daily.coords.cy[46], daily.coords.cz[46] = 156.422988891602,455.139099121094,140.726470947266
	daily.coords.cx[47], daily.coords.cy[47], daily.coords.cz[47] = 107.286636352539,438.130065917969,142.215042114258
	daily.coords.cx[48], daily.coords.cy[48], daily.coords.cz[48] = 29.7740650177002,433.651519775391,142.915161132813
	daily.coords.cx[49], daily.coords.cy[49], daily.coords.cz[49] = 255.622131347656,43.274097442627,88.4741821289063
	daily.coords.cx[50], daily.coords.cy[50], daily.coords.cz[50] = -75.3174514770508,471.676330566406,137.637756347656
	daily.coords.cx[51], daily.coords.cy[51], daily.coords.cz[51] = -110.303680419922,477.961273193359,137.031356811523
	daily.coords.cx[52], daily.coords.cy[52], daily.coords.cz[52] = -175.799423217773,476.318237304688,133.767761230469
	daily.coords.cx[53], daily.coords.cy[53], daily.coords.cz[53] = -244.389114379883,457.448455810547,126.823036193848
	daily.coords.cx[54], daily.coords.cy[54], daily.coords.cz[54] = -1336.69714355469,-926.82763671875,11.7527828216553
	daily.coords.cx[55], daily.coords.cy[55], daily.coords.cz[55] = -276.601531982422,460.2333984375,110.788360595703
	daily.coords.cx[56], daily.coords.cy[56], daily.coords.cz[56] = -1490.43249511719,-682.102905273438,28.3159046173096
	daily.coords.cx[57], daily.coords.cy[57], daily.coords.cz[57] = -1314.8125,-439.642547607422,35.2772674560547
	daily.coords.cx[58], daily.coords.cy[58], daily.coords.cz[58] = -314.761505126953,520.200805664063,120.157096862793
	daily.coords.cx[59], daily.coords.cy[59], daily.coords.cz[59] = -394.572570800781,475.525054931641,120.193588256836
	daily.coords.cx[60], daily.coords.cy[60], daily.coords.cz[60] = 1419.34240722656,1152.24865722656,114.673942565918
	daily.coords.cx[61], daily.coords.cy[61], daily.coords.cz[61] = -437.207458496094,502.355102539063,119.571662902832
	daily.coords.cx[62], daily.coords.cy[62], daily.coords.cz[62] = -463.696258544922,503.896697998047,121.461494445801
	daily.coords.cx[63], daily.coords.cy[63], daily.coords.cz[63] = -500.706176757813,493.524139404297,107.772003173828
	daily.coords.cx[64], daily.coords.cy[64], daily.coords.cz[64] = -531.058837890625,456.836730957031,103.201553344727
	daily.coords.cx[65], daily.coords.cy[65], daily.coords.cz[65] = -569.805297851563,583.734008789063,115.01634979248
	daily.coords.cx[66], daily.coords.cy[66], daily.coords.cz[66] = -557.953857421875,567.756652832031,112.853759765625
	daily.coords.cx[67], daily.coords.cy[67], daily.coords.cz[67] = -618.055969238281,550.924011230469,112.14421081543
	daily.coords.cx[68], daily.coords.cy[68], daily.coords.cz[68] = -655.738708496094,548.187805175781,111.453056335449
	daily.coords.cx[69], daily.coords.cy[69], daily.coords.cz[69] = -671.852233886719,530.052795410156,110.77986907959
	daily.coords.cx[70], daily.coords.cy[70], daily.coords.cz[70] = -755.120727539063,481.256652832031,107.473083496094
	daily.coords.cx[71], daily.coords.cy[71], daily.coords.cz[71] = -651.872802734375,458.988922119141,110.490898132324
	daily.coords.cx[72], daily.coords.cy[72], daily.coords.cz[72] = -702.292358398438,424.937347412109,106.944129943848
	daily.coords.cx[73], daily.coords.cy[73], daily.coords.cz[73] = -2013.12878417969,-290.556732177734,32.0963401794434
	daily.coords.cx[74], daily.coords.cy[74], daily.coords.cz[74] = -792.6884765625,415.536346435547,91.6127853393555
	daily.coords.cx[75], daily.coords.cy[75], daily.coords.cz[75] = -1714.65356445313,-197.835693359375,57.6977310180664
	daily.coords.cx[76], daily.coords.cy[76], daily.coords.cz[76] = -819.223937988281,458.750823974609,90.1694793701172
	daily.flag[1] = 1
	daily.flag[2] = GetRandomIntInRange(1, 76)
	onJobLegal = 1
	TriggerServerEvent("poleemploi:getjobs")
	Wait(2000)
	DrawMissionTextpool("Conduisez et allez nettoyer les ~y~piscines~w~.", 10000)
end

function DrawMissionTextpool(m_text, showtime)
	ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

function showLoadingPromtpool(showText, showTime, showType)
	Citizen.CreateThread(function()
		Citizen.Wait(0)
		N_0xaba17d7ce615adbf("STRING") -- set type
		AddTextComponentString(showText) -- sets the text
		N_0xbd12f8228410d9b4(showType) -- show promt (types = 3)
		Citizen.Wait(showTime) -- show time
		N_0x10d373323e5b9c0d() -- remove promt
	end)
end

function DrawNotif(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function ShowInfoJobPool(text, state)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, state, 0, -1)
end

function StopJobPool()
	if daily.blip[1] ~= nil and DoesBlipExist(daily.blip[1]) then
		Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(daily.blip[1]))
		daily.blip[1] = nil
	end
	onJobLegal = 0
	MISSION.truck = nil
	daily.flag[1] = nil
	daily.flag[2] = nil
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if onJobLegal == 0 then
			if (myjob == 2) then
				if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					if IsVehicleModel(GetVehiclePedIsUsing(GetPlayerPed(-1)), GetHashKey("utillitruck3", _r)) then
					--if IsVehicleModel(GetVehiclePedIsUsing(GetPlayerPed(-1)), 0x58B3979C) then
						TriggerServerEvent("poleemploi:getjobs")
						Wait(100)
						if myjob == 2 then
							StartJobPool()
							if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then -- Male
                SetPedComponentVariation(GetPlayerPed(-1),11, 9, 4, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 6, 6, 0, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 4, 6, 1, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 3, 30, 0, 0)
              elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then -- Female
                SetPedComponentVariation(GetPlayerPed(-1),11, 50, 0, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 8, 9, 0, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 4, 49, 0, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 3, 2, 0, 0)
              end
						else
							TriggerEvent("itinerance:notif", "~r~Vous devez être nettoyeur de piscines !")
						end
					end
				end
			end
		elseif onJobLegal == 1 then
			if myjob == 2 then
				if not IsEntityDead(MISSION.truck) then
					if daily.flag[1] == 1 then
						daily.flag[2] = GetRandomIntInRange(1, 76)
						daily.blip[1] = AddBlipForCoord(daily.coords.cx[daily.flag[2]],daily.coords.cy[daily.flag[2]],daily.coords.cz[daily.flag[2]])
						N_0x80ead8e2e1d5d52e(daily.blip[1])
						SetBlipRoute(daily.blip[1], 1)
						distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), daily.coords.cx[daily.flag[2]],daily.coords.cy[daily.flag[2]],daily.coords.cz[daily.flag[2]], true)
						daily.flag[1] = 2
					end
					if daily.flag[1] == 2 then
						if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), daily.coords.cx[daily.flag[2]],daily.coords.cy[daily.flag[2]],daily.coords.cz[daily.flag[2]], true) > 5.0001 then
							--DrawMarker(1, daily.coords.cx[daily.flag[2]],daily.coords.cy[daily.flag[2]],daily.coords.cz[daily.flag[2]]-1.0001, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.0, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
						else
							local plyCoords = GetEntityCoords(GetPlayerPed(-1))
							if math.abs(plyCoords['z'] - daily.coords.cz[daily.flag[2]]) < 1 then
								if daily.blip[1] ~= nil and DoesBlipExist(daily.blip[1]) then
									Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(daily.blip[1]))
									daily.blip[1] = nil
								end
								if IsPedInAnyVehicle(LocalPed(), true) == false then
									ShowInfoJobPool("Appuyez sur ~INPUT_CONTEXT~ pour ~b~nettoyer la piscine~w~.", 0)
									if IsControlJustPressed(1,38) then
										local dict = "pickup_object"
										local anim = "pickup_low"
										RequestAnimDict(dict)

										while not HasAnimDictLoaded(dict) do
											Citizen.Wait(0)
										end

										local myPed = PlayerPedId()
										local animation = anim
										local flags = 16 -- only play the animation on the upper body

										TaskPlayAnim(myPed, dict, animation, 8.0, -8, -1, flags, 0, 0, 0, 0)
										Wait(2000)
										DrawMissionTextpool("Vous avez ~g~nettoyé~w~ une piscine !", 5000)
										TriggerServerEvent('job:success', distance/175)
										--TriggerServerEvent('CheckPool')
										Wait(1000)
										daily.flag[1] = 1
										daily.flag[2] = GetRandomIntInRange(1, 76)
									end
								end
							end
						end
					end
				else
					StopJobPool()
					TriggerEvent("itinerance:notif", "~r~Votre camion est hors service !")
				end
			end
		end
	end
end)

function poolEnding()
	onJobLegal = 2
	Wait(500)
	StopJobPool()
end

RegisterNetEvent("jobslegal:poolEnding")
AddEventHandler("jobslegal:poolEnding", function()
  poolEnding()
end)

AddEventHandler('playerSpawned', function(spawn)
	ShowpoolBlips(true)
end)
