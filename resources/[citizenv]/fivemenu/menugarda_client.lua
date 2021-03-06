local currentlyTowedVehicle = nil

local pos = {
[1] = { ["x"] = 191.33288574219, ["y"] = -1024.1374511719, ["z"] = -99.0, ["name"] = 'Entreprise Taxi'},
[2] = { ["x"] = 172.90441894531, ["y"] = -1000.0408935547, ["z"] = -98.999847412109, ["name"] = 'Entreprise Taxi'},

}

AddEventHandler("menugarda:menuOG", function(target, rangGarda)
VMenu.AddMenu(98, "", "default")
	if target ~= -1 then
		nameTarget = "Vous ciblez quelqu'un"
	else
		nameTarget = "Aucune cible"
	end
	VMenu.garda = true
	Wait(100)
	VMenu.AddSep(98, tostring(nameTarget))
	if rangGarda == 26 or rangGarda == 28 then
		VMenu.AddSep(98, "Employé")
	elseif rangGarda == 27 then
		VMenu.AddSep(98, "Patron")
	end
	VMenu.AddFunc(98, "~r~Retour", "vmenu:MainMenuOG", {}, "Retour")
	VMenu.AddNum10(98, "Montant facture", "AmfacGarda", 0, 10000, "La facturation vous permet d'envoyer directement l'argent dans le coffre")
	VMenu.AddFunc(98, "Donner facture", "menugarda:givefac", {getOpt("AmfacGarda")}, "Accéder")
	VMenu.AddFunc(98, "Fouiller le civil le plus près", "menupolice:verifp", {}, "Accéder")
	VMenu.AddBool(98, "Menotter/Démenotter", "Menotter", false, "Toggle")
	if rangGarda == 27 then
		VMenu.AddSep(98, "~y~Gestion administrative~w~")
		VMenu.AddFunc(98, "Céder la place de patron", "menugarda:promote", {}, "Accéder")
		VMenu.AddFunc(98, "Engager chez LaGarda", "menugarda:hire", {}, "Accéder")
		VMenu.AddFunc(98, "Renvoyer", "menugarda:fire", {}, "Accéder")
	end
end)

AddEventHandler("menugarda:hire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menugarda:hire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menugarda:fire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menugarda:fire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menugarda:promote", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menugarda:promote_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menugarda:givefac", function(target, prix)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menugarda:givefac_s", cible, prix)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)
