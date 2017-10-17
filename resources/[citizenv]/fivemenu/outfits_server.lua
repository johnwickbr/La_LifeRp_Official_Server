function updateHair(player, e, v, t, y, g, h,a,b,c)
    local hair = e
    local hairsec = v
    local haircolor = t
    local haircolorsec = y
    local beard = g
    local beardcolor = h
    local sourcil = a
    local sourcilcolor = b
    local sourcilcolorsec = c
    --print()
    --print(lipstick_color)
    MySQL.Async.execute("UPDATE outfits SET `hair`=@hair WHERE identifier=@user",{['@hair'] = hair, ['@user'] = player})
    MySQL.Async.execute("UPDATE outfits SET `hair_text`=@hairsec WHERE identifier=@user",{['@hairsec'] = hairsec, ['@user'] = player})
    MySQL.Async.execute("UPDATE outfits SET `haircolor`=@haircolor WHERE identifier=@user",{['@haircolor'] = haircolor, ['@user'] = player})
    MySQL.Async.execute("UPDATE outfits SET `haircolor_text`=@haircolorsec WHERE identifier=@user",{['@haircolorsec'] = haircolorsec, ['@user'] = player})
    MySQL.Async.execute("UPDATE outfits SET `beard_text`=@beardcolor WHERE identifier=@user",{['@beardcolor'] = beardcolor, ['@user'] = player})
    MySQL.Async.execute("UPDATE outfits SET `beard`=@beard WHERE identifier=@user",{['@beard'] = beard, ['@user'] = player})
    MySQL.Async.execute("UPDATE outfits SET `sourcil`=@sourcil WHERE identifier=@user",{['@sourcil'] = sourcil, ['@user'] = player})
    MySQL.Async.execute("UPDATE outfits SET `sourcilcolor`=@sourcilcolor WHERE identifier=@user",{['@sourcilcolor'] = sourcilcolor, ['@user'] = player})
    MySQL.Async.execute("UPDATE outfits SET `sourcilcolorsec`=@sourcilcolorsec WHERE identifier=@user",{['@sourcilcolorsec'] = sourcilcolorsec, ['@user'] = player})

end

function updatemakeup(player,a,b,c)
    --print(a)
    --print(b)
    --print(c)
    MySQL.Async.execute("UPDATE outfits SET `makeup`=@makeup WHERE identifier=@user",{['@makeup'] = a, ['@user'] = player})
    MySQL.Async.execute("UPDATE outfits SET `lipstick`=@lipstick WHERE identifier=@user",{['@lipstick'] = b, ['@user'] = player})
    MySQL.Async.execute("UPDATE outfits SET `lipstick_color`=@lipstick_color WHERE identifier=@user",{['@lipstick_color'] = c, ['@user'] = player})
end

RegisterServerEvent('vmenu:getmake')
AddEventHandler("vmenu:getmake", function(makeup,lipstick,lipstick_color) -- target = Dernier joueur à avoir parlé, pas besoin ici. Mais obligatoire !
    local playerSource = source
    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier
            updatemakeup(player,makeup,lipstick,lipstick_color)
            --print(sourcil)
            --print(sourcilcolor)
        else
            TriggerEvent("es:desyncMsg")
        end
    end)
end)

RegisterServerEvent('vmenu:getHair')
AddEventHandler('vmenu:getHair', function(hair, hairsec, haircolor, haircolorsec, beard, beardcolor,sourcil,sourcilcolor,sourcilcolorsec)
    local playerSource = source
    --print(lipstick_color)
    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier
            updateHair(player, hair, hairsec, haircolor, haircolorsec, beard, beardcolor,sourcil,sourcilcolor,sourcilcolorsec)
            --print(sourcil)
            --print(sourcilcolor)
        else
            TriggerEvent("es:desyncMsg")
        end
    end)
end)

RegisterServerEvent('vmenu:setclienttattoo')
AddEventHandler('vmenu:setclienttattoo', function(torso,bras_g,bras_d,jambe_g,jambe_d,tete,money)
    local playerSource = source
    local price = money
    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            print(user.money)
            if (user.money >= price) then
                LaLife.Player.Manager.RemovePlayerMoney(user,price)
                local player = user.identifier
                updatetats(player, torso,bras_g,bras_d,jambe_g,jambe_d,tete)
                MySQL.Async.fetchAll("SELECT money FROM user_appartement WHERE name = @name", {['@name'] = 'Tattoo'}, function (result)

                    local new_balance = (result[1].money + price)/2
                    print(new_balance)
                    MySQL.Async.execute("UPDATE user_appartement SET `money`=@value WHERE name = @name", {['@value'] = new_balance, ['@name'] = 'Tattoo'})
                end)
                TriggerClientEvent("itinerance:notif", playerSource, "Vous avez reçu une facture de ~r~".. price.."$~w~.")
            else
                print("no_money")
                TriggerClientEvent("itinerance:notif", playerSource, "~r~ Vous devez avoir " .. price .. "$" .. " sur vous.")
            end
        else
            TriggerEvent("es:desyncMsg")
        end
    end)
end)

function updateFace(player, e, v, t,c)
  --print("change la face")
    local sexe = "mp_m_freemode_01"
    if e == 0 then
        sexe = "mp_m_freemode_01"
    else
        sexe = "mp_f_freemode_01"
    end
    local face = v
    local face_text = t
    local couleur = c
    MySQL.Async.execute("UPDATE outfits SET `skin`=@skin WHERE identifier=@user",{['@skin'] = sexe, ['@user'] = player})
    MySQL.Async.execute("UPDATE outfits SET `face`=@face WHERE identifier=@user",{['@face'] = face, ['@user'] = player})
    MySQL.Async.execute("UPDATE outfits SET `face_text`=@face_text WHERE identifier=@user",{['@face_text'] = face_text, ['@user'] = player})
    MySQL.Async.execute("UPDATE outfits SET `couleur`=@couleur WHERE identifier=@user",{['@couleur'] = couleur, ['@user'] = player})
end

function updatetats(player,torso,bras_g,bras_d,jambe_g,jambe_d,tete)
    local face = v
    local face_text = t
    MySQL.Async.execute("UPDATE outfits SET `tattoo_torso`=@tattoo WHERE identifier=@user",{['@tattoo'] = torso, ['@user'] = player})
    MySQL.Async.execute("UPDATE outfits SET `tattoo_bras_g`=@tattoo WHERE identifier=@user",{['@tattoo'] = bras_g, ['@user'] = player})
    MySQL.Async.execute("UPDATE outfits SET `tattoo_bras_d`=@tattoo WHERE identifier=@user",{['@tattoo'] = bras_d, ['@user'] = player})
    MySQL.Async.execute("UPDATE outfits SET `tattoo_jambe_g`=@tattoo WHERE identifier=@user",{['@tattoo'] = jambe_g, ['@user'] = player})
    MySQL.Async.execute("UPDATE outfits SET `tattoo_jambe_d`=@tattoo WHERE identifier=@user",{['@tattoo'] = jambe_d, ['@user'] = player})
    MySQL.Async.execute("UPDATE outfits SET `tattoo_tete`=@tattoo WHERE identifier=@user",{['@tattoo'] = tete, ['@user'] = player})
end

RegisterServerEvent('vmenu:getFace')
AddEventHandler('vmenu:getFace', function(e, v, t,c)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier
            local sexe = "mp_m_freemode_01"
            if e == 0 then
                sexe = "mp_m_freemode_01"
            else
                sexe = "mp_f_freemode_01"
            end
            updateFace(player, e, v, t,c)
        else
            TriggerEvent("es:desyncMsg")
        end
    end)
end)

function updateOutfit(player, e)
  -- face 0, hair 2, three 3, pants 4, parachute 5, shoes 6, par dessus torso 8, armure 9, badges 10 (8-0,1,2,3 Police badges), torso 11, shirt 8,
  -- Format pour comprendre le contenu de la table
  local three = ""..e[1]
  local ttext = ""..e[2]
  local pants = ""..e[3]
  local ptext = e[4]
  local shoes = e[5]
  local shtext = e[6]
  local seven = e[7]
  local stext = e[8]
  local shirt = e[9]
  local shitext = e[10]
  local torso = e[11]
  local totext = e[12]
  local hat = e[13]
  local hattext = e[14]
  local glass = e[15]
  local glasstext = e[16]
  local watch = e[17]
  local watchtext = e[18]
  local beard = e[19]
  local beardtext = e[20]

  MySQL.Async.execute("UPDATE outfits SET `three`=@three,`three_text`=@ttext,`pants`=@pants,`pants_text`=@ptext,`shoes`=@shoes,`shoes_text`=@shtext,`seven`=@seven,`seven_text`=@stext,`shirt`=@shirt,`shirt_text`=@shitext,`torso`=@torso,`torso_text`=@totext,`hat`=@hat,`hat_text`=@hattext,`glass`=@glass,`glass_text`=@glasstext,`watch`=@watch,`watch_text`=@watchtext, `beard`=@beard,`beard_text`=@beardtext WHERE identifier=@user",{['@ttext'] = ttext, ['@three'] = three, ['@pants'] = pants, ['@ptext'] = ptext,['@shoes'] = shoes, ['@shtext'] = shtext,['@seven'] = seven, ['@stext'] = stext,['@shirt'] = shirt, ['@shitext'] = shitext, ['@torso'] = torso, ['@totext'] = totext, ['@hat'] = hat, ['@hattext'] = hattext, ['@glass'] = glass, ['@glasstext'] = glasstext, ['@watch'] = watch, ['@watchtext'] = watchtext, ['@beard'] = beard, ['@beardtext'] = beardtext, ['@user'] = player})

end

RegisterServerEvent('vmenu:getOutfit')
AddEventHandler('vmenu:getOutfit', function(e)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier
            updateOutfit(player, e)
        else
            TriggerEvent("es:desyncMsg")
        end
    end)
end)

---- RELOCALISER

-- RÉCUPÉRATION DES COMP DU PED DANS LA BDD
RegisterServerEvent('vmenu:lastChar')
AddEventHandler('vmenu:lastChar', function()
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier

            MySQL.Async.fetchAll("SELECT skin,face,face_text,hair,hair_text,pants,pants_text,shoes,shoes_text,torso,torso_text,shirt,shirt_text,three,three_text,seven,seven_text,haircolor,haircolor_text,hat,hat_text,glass,glass_text,watch,watch_text,beard,beard_text,sourcil,sourcilcolor,sourcilcolorsec,tattoo_bras_d,tattoo_bras_g,tattoo_jambe_g,tattoo_jambe_d,tattoo_tete,tattoo_torso,makeup,lipstick,lipstick_color,tattoo_dos,couleur FROM outfits WHERE identifier=@user",{['@user']=player}, function(result)
                TriggerClientEvent("vmenu:updateChar",playerSource,{result[1].face,result[1].face_text,result[1].hair,result[1].hair_text,result[1].pants,result[1].pants_text,result[1].shoes,result[1].shoes_text,result[1].torso,result[1].torso_text,result[1].shirt,result[1].shirt_text,result[1].three,result[1].three_text,
                result[1].seven,result[1].seven_text,result[1].haircolor,result[1].haircolor_text,result[1].skin,result[1].hat,result[1].hat_text,result[1].glass,result[1].glass_text,result[1].watch,result[1].watch_text,result[1].beard,result[1].beard_text,result[1].sourcil,result[1].sourcilcolor,result[1].sourcilcolorsec,
                result[1].tattoo_bras_d,result[1].tattoo_bras_g,result[1].tattoo_jambe_g,result[1].tattoo_jambe_d,result[1].tattoo_tete,result[1].tattoo_torso,result[1].makeup,result[1].lipstick,result[1].lipstick_color,result[1].tattoo_dos,result[1].couleur})
            end)
        else
            TriggerEvent("es:desyncMsg")
        end
    end)
end)

RegisterServerEvent('vmenu:lastCharInShop')
AddEventHandler('vmenu:lastCharInShop', function(model)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier

           MySQL.Async.fetchAll("SELECT skin,face,face_text,hair,hair_text,pants,pants_text,shoes,shoes_text,torso,torso_text,shirt,shirt_text,three,three_text,seven,seven_text,haircolor,haircolor_text,hat,hat_text,glass,glass_text,watch,watch_text,beard,beard_text,tattoo_bras_d,tattoo_bras_g,tattoo_jambe_g,tattoo_jambe_d,tattoo_tete,tattoo_torso,makeup,lipstick,lipstick_color,tattoo_dos,couleur FROM outfits WHERE identifier=@user",{['@user']=player}, function(result)
                TriggerClientEvent("vmenu:updateCharInShop",playerSource,{result[1].face,result[1].face_text,result[1].hair,result[1].hair_text,result[1].pants,result[1].pants_text,result[1].shoes,result[1].shoes_text,result[1].torso,result[1].torso_text,result[1].shirt,result[1].shirt_text,result[1].three,result[1].three_text,result[1].seven,result[1].seven_text,result[1].haircolor,result[1].haircolor_text,result[1].skin,result[1].hat,result[1].hat_text,result[1].glass,result[1].glass_text,result[1].watch,result[1].watch_text,result[1].beard,result[1].beard_text,result[1].sourcil,result[1].sourcilcolor,result[1].sourcilcolorsec,result[1].tattoo_bras_d,result[1].tattoo_bras_g,result[1].tattoo_jambe_g,result[1].tattoo_jambe_d,result[1].tattoo_tete,result[1].tattoo_torso,result[1].makeup,result[1].lipstick,result[1].lipstick_color,result[1].tattoo_dos,result[1].couleur})
                --print(result[1].makeup)
            end)
        else
            TriggerEvent("es:desyncMsg")
        end
    end)
end)

-- APPELÉ DU SERVEUR, BESOIN D'UN PARAMÈTRE
RegisterServerEvent('vmenu:fromSlastChar')
AddEventHandler('vmenu:fromSlastChar', function(playerSource)
  local playerSource = source
    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier

            MySQL.Async.fetchAll("SELECT skin,face,face_text,hair,hair_text,pants,pants_text,shoes,shoes_text,torso,torso_text,shirt,shirt_text,three,three_text,seven,seven_text,haircolor,haircolor_text,hat,hat_text,glass,glass_text,watch,watch_text,beard,beard_text FROM outfits WHERE identifier=@user",{['@user']=player}, function(result)
                TriggerClientEvent("vmenu:updateChar",playerSource,{result[1].face,result[1].face_text,result[1].hair,result[1].hair_text,result[1].pants,result[1].pants_text,result[1].shoes,result[1].shoes_text,result[1].torso,result[1].torso_text,result[1].shirt,result[1].shirt_text,result[1].three,result[1].three_text,result[1].seven,result[1].seven_text,result[1].haircolor,result[1].haircolor_text,result[1].skin,result[1].hat,result[1].hat_text,result[1].glass,result[1].glass_text,result[1].watch,result[1].watch_text,result[1].beard,result[1].beard_text,result[1].sourcil,result[1].sourcilcolor,result[1].sourcilcolorsec})
            end)
        else
            TriggerEvent("es:desyncMsg")
        end
    end)
end)
