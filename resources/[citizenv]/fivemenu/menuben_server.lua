RegisterServerEvent('menuben:hire_s')
AddEventHandler('menuben:hire_s', function(netID)
	local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
	if (user) then
		local identifier = user.identifier
		MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 55, ['@identifier'] = tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, 55,user.subjob)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
		TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été engagé en tant qu'employer' !")
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
end)

RegisterServerEvent('menuben:fire_s')
AddEventHandler('menuben:fire_s', function(netID)
local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	local tIdentifier = GetPlayerIdentifiers(netID)
  	local identifier = tIdentifier[1]
	if (user) then
		if tonumber(user.job) == 55 then
		MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 1, ['@identifier'] =  tostring(identifier)})
		LaLife.Player.Manager.SetPlayerJob(user, 1,user.subjob)
    	TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
		TriggerClientEvent("itinerance:notif", netID, "~r~Vous avez été licencié !")
		else
		TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas un employer !")
		end
	else
		TriggerClientEvent("itinerance:notif", playerSource, "~o~Une erreur de sync s'est produite !")
	end
  end)
end)

RegisterServerEvent('menuben:promote_s')
AddEventHandler('menuben:promote_s', function(netID)
	local playerSource = source
 	TriggerEvent('es:getPlayerFromId', netID, function(user)
	TriggerEvent('es:getPlayerFromId', playerSource, function(usern)
	local tIdentifier = GetPlayerIdentifiers(netID)
	local identifier = tIdentifier[1]
	local tIdentifiern = GetPlayerIdentifiers(playerSource)
	local identifiern = tIdentifiern[1]
		if (tonumber(user.job)) == 55 then
			MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 54, ['@identifier'] = tostring(identifier)})
			LaLife.Player.Manager.SetPlayerJob(user, 54,user.subjob)
			MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = 55, ['@identifier'] = tostring(identifiern)})
			LaLife.Player.Manager.SetPlayerJob(usern, 55,user.subjob)
			TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée ! Vous avez été retrogradé.")
			TriggerClientEvent("itinerance:notif", netID, "~g~Vous avez été promu !")
		else
			TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'est pas un empployer !")
		end
  end)
  end)
end)

function bankBalance(player)
    return tonumber(MySQL.Sync.fetchScalar("SELECT bankbalance FROM users WHERE identifier = @name", {['@name'] = player}))
end

RegisterServerEvent('menuben:givefac_s')
AddEventHandler('menuben:givefac_s', function(netID, amount)
	local playerSource = source
	local target = netID
  TriggerEvent('es:getPlayerFromId', target, function(user)
--  if user.money >= amount then
		local player = user.identifier
		local bankbalance = bankBalance(user.identifier)
		local new_balance = bankbalance - amount
		--print(new_balance)
		MySQL.Async.execute("UPDATE users SET `bankbalance`=@value WHERE identifier = @identifier", {['@value'] = new_balance, ['@identifier'] = player})
    MySQL.Async.fetchAll("SELECT money FROM user_appartement WHERE name = @name", {['@name'] = 'LSCustom Coffre 1/5'}, function (result)
      MySQL.Async.execute("UPDATE user_appartement SET `money`=@value WHERE name = @identifier", {['@value'] = (tonumber(result[1].money)+tonumber(amount)), ['@identifier'] = 'benny Coffre'})
      TriggerClientEvent("itinerance:notif", target, "Vous avez reçu une facture de ~r~".. amount.."$~w~.")
    end)
--  else
--    TriggerClientEvent("itinerance:notif", playerSource, "~r~La cible n'a pas assez d'argent.")
--  end
  end)
end)
