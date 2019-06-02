function ia()
for i=1,polimen do
	
	-----------TAPELAPOLICE-----------------
	if bonus.hamburger:time() > 2 or bonus.star:time() > 2  then
		if police[i].x >= x-20 and police[i].x <= x+20 and police[i].y >= y-20 and police[i].y <= y+20 then--TU BOUFFES LA POLICE
			sound.play(hbfsn[5],2)
			xp = xp + 10
			score = score + 100
			zyui = math.random(1,4)--Haut,Droite,Bas,Gauche
			if zyui == 1 then
				police[i].x = math.random(0,480)
				police[i].y = -50
			elseif zyui == 2 then
				police[i].x = 530
				police[i].y = math.random(0,272)
			elseif zyui == 3 then
				police[i].x = math.random(0,480)
				police[i].y = 322
			elseif zyui == 4 then
				police[i].x = -50
				police[i].y = math.random(0,272)
			end
			if combo == 0 then
				comboter:reset(0)
			end
			police[i].strat = "normal"
			if alert == 3 and camion.statut == 0 and camion.party <= 2 then
				police[i].strat = "camion"
				camion.party = camion.party + 1
			end
			kill = kill + 1
			combo = combo + 1
			comboter:start()
		end
	end
	-----------------------------------------
	
	if score > 2500 or kill > 5 then
		alert = 3
	elseif score > 1500 or kill > 3 then
		alert = 2
	elseif score > 500 or kill > 2 then
		alert = 1
	end
	
	if alert == 1 then
		police[i].ratio = 1
		polimen = 4
	elseif alert == 2 then--Etat d'alerte
		if math.random(0,2) < 2 then
			police[i].ratio = 1
		else
			police[i].ratio = 2
		end
		polimen = 6
	elseif alert == 3 then--!!! Etat d'alerte maximal !!!
		if math.random(0,2) < 2 then
			police[i].ratio = 2
		else
			police[i].ratio = 1
		end
		polimen = 8
	end
	
	if camion.statut == 3 and police[i].strat == "camion" then
		police[i].x = 240
		police[i].y = camion.y
		police[i].strat = "normal"
	end

	if x >= police[i].x and x <= police[i].x+30 and y >= police[i].y and y <= police[i].y+20 and pause == false  then--Si attrapé par la police, je souffre
		aie = 1
		vie = vie - 3
		statut = police[i].statut--Coup de pied dans le daft punk
		if police[i].statut == "droite" then
			x = x+10
		elseif police[i].statut == "gauche" then
			x = x-10
		elseif police[i].statut == "haut" then
			y = y-10
		elseif police[i].statut == "bas" then
			y = y+10
		end
	else
		aie = skin
	end
	
	
	
--IA DE DIRECTION--

	
	
	--|Collisions entre les policiers|--
for j=1,polimen do
	
	if police[i].x ~= police[j].x and police[i].y ~= police[j].y and police[i].x >= police[j].x and police[i].x <= police[j].x+26 and police[i].y >= police[j].y and police[i].y <= police[j].y+36 then
		if x > police[i].x then
			police[i].x = police[i].x - police[i].ratio - 2
	 	   police[i].statut = "droite"
		end
		if x < police[i].x then
	 	   police[i].x = police[i].x + police[i].ratio + 2
		   police[i].statut = "gauche"
		end
	 	if y > police[i].y then
	 	   police[i].x = police[i].x - police[i].ratio - 2
		   police[i].statut = "bas"
		end
		if y < police[i].y then
			police[i].x = police[i].x + police[i].ratio + 2
			police[i].statut = "haut"
		end
	end
	
end
	------------------------------------

	
	
	if pause == true then
		--ON BOUGE PAS
	elseif police[i].strat ~= "camion" and policaie == 1 then--Mode on a peur mais pas en mode camion
		if x > police[i].x then--La police s'en va
			police[i].statut = "gauche"
			police[i].x = police[i].x - police[i].ratio 
		elseif x < police[i].x then 
			police[i].statut = "droite"
			police[i].x = police[i].x + police[i].ratio 
		elseif y > police[i].y then
			police[i].statut = "haut"
			police[i].y = police[i].y - police[i].ratio
		elseif y < police[i].y then
			police[i].statut = "bas"
			police[i].y = police[i].y + police[i].ratio
		end
		elseif policaie == 0 then
			if police[i].strat == "normal"  then --Mode normal
				if x > police[i].x then--La police y va !
					police[i].statut = "droite"
					police[i].x = police[i].x + police[i].ratio 
				elseif x < police[i].x then 
					police[i].statut = "gauche"
					police[i].x = police[i].x - police[i].ratio 
				elseif y > police[i].y then
					police[i].statut = "bas"
					police[i].y = police[i].y + police[i].ratio
				elseif y < police[i].y then
					police[i].statut = "haut"
					police[i].y = police[i].y - police[i].ratio
				end	
			elseif police[i].strat == "hori" then --Mode horizontal
				if y > police[i].y then
					police[i].statut = "bas"
					police[i].y = police[i].y + police[i].ratio
				elseif y < police[i].y then
					police[i].statut = "haut"
					police[i].y = police[i].y - police[i].ratio
				end
			elseif police[i].strat == "verti" then --Mode vertical
				if x > police[i].x then--La police y va !
					police[i].statut = "droite"
					police[i].x = police[i].x + police[i].ratio 
				elseif x < police[i].x then 
					police[i].statut = "gauche"
					police[i].x = police[i].x - police[i].ratio 
				end
			elseif police[i].strat == "pause" then --Mode pause
				
			end
		end
	
	


	if police[i].statut == "droite" then
		
			
		
		if polimov:time() <= 500/ police[i].ratio then
			--1
			image.blitsprite(sp_police[1+policaie],police[i].x,police[i].y,0)
		elseif polimov:time() >= 500/ police[i].ratio and polimov:time() <= 1000/ police[i].ratio then
			--2
			image.blitsprite(sp_police[1+policaie],police[i].x,police[i].y,1)
		elseif polimov:time() >= 1000/ police[i].ratio and polimov:time() <= 1500/ police[i].ratio then
			--1
			image.blitsprite(sp_police[1+policaie],police[i].x,police[i].y,0)
		elseif polimov:time() >= 1500/ police[i].ratio and polimov:time() <= 2000/ police[i].ratio then
			--3
			image.blitsprite(sp_police[1+policaie],police[i].x,police[i].y,2)
		end
	
	elseif police[i].statut == "gauche" then
		
		
		if polimov:time() <= 500/ police[i].ratio then
			--1
			image.blitsprite(sp_police[1+policaie],police[i].x,police[i].y,3)
		elseif polimov:time() >= 500/ police[i].ratio and polimov:time() <= 1000/police[i].ratio then
			--2
			image.blitsprite(sp_police[1+policaie],police[i].x,police[i].y,4)
		elseif polimov:time() >= 1000/ police[i].ratio and polimov:time() <= 1500/ police[i].ratio then
			--1
			image.blitsprite(sp_police[1+policaie],police[i].x,police[i].y,3)
		elseif polimov:time() >= 1500/ police[i].ratio and polimov:time() <= 2000/ police[i].ratio then
			--3
			image.blitsprite(sp_police[1+policaie],police[i].x,police[i].y,5)
		end
		
	elseif police[i].statut == "haut" then
		
		
		if polimov:time() <= 500/police[i].ratio then
			--1
			image.blitsprite(sp_police[1+policaie],police[i].x,police[i].y,6)
		elseif polimov:time() >= 500/police[i].ratio and polimov:time() <= 1000/ police[i].ratio then
			--2
			image.blitsprite(sp_police[1+policaie],police[i].x,police[i].y,7)
		elseif polimov:time() >= 1000/police[i].ratio and polimov:time() <= 1500/ police[i].ratio then
			--1
			image.blitsprite(sp_police[1+policaie],police[i].x,police[i].y,6)
		elseif polimov:time() >= 1500/police[i].ratio and polimov:time() <= 2000/ police[i].ratio then
			--3
			image.blitsprite(sp_police[1+policaie],police[i].x,police[i].y,8)
		end
		
	else
		
			
		if polimov:time() <= 500/ police[i].ratio then
			--1
			image.blitsprite(sp_police[1+policaie],police[i].x,police[i].y,9)
		elseif polimov:time() >= 500/ police[i].ratio and polimov:time() <= 1000/police[i].ratio then
			--2
			image.blitsprite(sp_police[1+policaie],police[i].x,police[i].y,10)
		elseif polimov:time() >= 1000/ police[i].ratio and polimov:time() <= 1500/ police[i].ratio then
			--1
			image.blitsprite(sp_police[1+policaie],police[i].x,police[i].y,9)
		elseif polimov:time() >= 1500/ police[i].ratio and polimov:time() <= 2000/ police[i].ratio then
			--3
			image.blitsprite(sp_police[1+policaie],police[i].x,police[i].y,11)
		end		
	end	
	
if police[i].x > 0 and police[i].y > 0 and police[i].x < 480 and police[i].y < 272 then
	police[i].strat = "normal"
end
if police[i].x < -60 then 
	police[i].x = -60
elseif police[i].x > 600 then 
	police[i].x = 600
end
if police[i].y < -60 then 
	police[i].y = -60
elseif police[i].y > 400 then 
	police[i].y = 400
end

	if polimov:time() >= 2000 / police[i].ratio then
		polimov:stop()
		if police[i].strat == "pause" then
			police[i].strat = "normal"
		end
		if jailedroit > 3 then
			if police[i].strat ~= "camion" and police[i].x > 0 and police[i].y > 0 and police[i].x < 480 and police[i].y < 272 then
				police[i].strat = straty[additem]
			end
		end
		if policaie < 1 or pause == false then
			polimov:reset()
			polimov:start()
		end
	end
end



end


function move()
	if pause == false then
	if buttons.held.right or buttons.analogx > 64 then
		x = x + 2 + vivi
		statut = "droite"
	elseif buttons.held.left or buttons.analogx < -64 then
		x = x - 2 - vivi
		statut = "gauche"
	elseif buttons.held.up  or buttons.analogy < -64  then
		y = y - 2 - vivi
		statut = "haut"
	elseif buttons.held.down or buttons.analogy > 64 then
		y = y + 2 + vivi
		statut = "bas"
	elseif not buttons.held.right and not buttons.held.left and not buttons.held.up and not buttons.held.up and not buttons.held.down and not buttons.analogx and not buttons.analogy then
		moving:reset(0)
	end 
	end
	
	if statut == "gauche" then
	
		if moving:time() <= 250 then
			--1
			image.blitsprite(sp_daft[typy][aie],x,y,0)
		elseif moving:time() >= 250 and moving:time() <= 500 then
			--2
			image.blitsprite(sp_daft[typy][aie],x,y,1)
		elseif moving:time() >= 500 and moving:time() <= 1000 then
			--1
			image.blitsprite(sp_daft[typy][aie],x,y,0)
		elseif moving:time() >= 1000 and moving:time() <= 1500 then
			--3
			image.blitsprite(sp_daft[typy][aie],x,y,2)
		end
		
	elseif statut == "droite" then
		
		if moving:time() <= 250 then
			--1
			image.blitsprite(sp_daft[typy][aie],x,y,3)
		elseif moving:time() >= 250 and moving:time() <= 500 then
			--2
			image.blitsprite(sp_daft[typy][aie],x,y,4)
		elseif moving:time() >= 500 and moving:time() <= 1000 then
			--1
			image.blitsprite(sp_daft[typy][aie],x,y,3)
		elseif moving:time() >= 1000 and moving:time() <= 1500 then
			--3
			image.blitsprite(sp_daft[typy][aie],x,y,5)
		end
		
	elseif statut == "haut" then
		
		if moving:time() <= 250 then
			--1
			image.blitsprite(sp_daft[typy][aie],x,y,6)
		elseif moving:time() >= 250 and moving:time() <= 500 then
			--2
			image.blitsprite(sp_daft[typy][aie],x,y,7)
		elseif moving:time() >= 500 and moving:time() <= 1000 then
			--1
			image.blitsprite(sp_daft[typy][aie],x,y,6)
		elseif moving:time() >= 1000 and moving:time() <= 1500 then
			--3
			image.blitsprite(sp_daft[typy][aie],x,y,8)
		end
		
	else 
		
		if moving:time() <= 250 then
			--1
			image.blitsprite(sp_daft[typy][aie],x,y,9)
		elseif moving:time() >= 250 and moving:time() <= 500 then
			--2
			image.blitsprite(sp_daft[typy][aie],x,y,10)
		elseif moving:time() >= 500 and moving:time() <= 1000 then
			--1
			image.blitsprite(sp_daft[typy][aie],x,y,9)
		elseif moving:time() >= 1000 and moving:time() <= 1500 then
			--3
			image.blitsprite(sp_daft[typy][aie],x,y,11)
		end		
	end	
		
	if moving:time() >= 1500 then
		if pause == false or not buttons.held.right and not buttons.held.left and not buttons.held.up and not buttons.held.up and not buttons.held.down and not buttons.analogx and not buttons.analogy then
			moving:stop()
			additem = math.random(1,10)
			jailedroit = math.random(1,5)
			if eclair > 0 then
				score = score + 2
				xp = xp+1
			end
			moving:reset()	
			moving:start()
		else
			moving:reset(1500)
		end
	end
	
-------Collisions limite ecran--------

if x < 0 then 
	x = 0 
elseif x + 18> 480 then 
	x = 480 - 18
end
if y < 0 then y = 0 elseif y + 24 > 272 then 
y = 272 - 24 
end

--------------------------------------
		
		
		
end

function soundmusic()
	--Working thanks to gdljjrod
	if snd then
	    if not snd:playing() and play == 0 then
			cont=cont+1
			snd:play()
			play=2
		end
		if play == 2 and eclair < 0 or pause == true then
			sound.pause(snd,1)
			play=1
		end
		if play == 1 and eclair > 0 and pause == false then
			sound.pause(snd,-1)
			play=2
		end
		if not snd:playing() and play == 2 then
			snd=nil
			math.randomseed(os.time())
			rand=math.random(1,#mp3)
			snd = sound.load(mp3[rand])
			data = sound.getid3(mp3[rand])
			mode_data = 0
			play = 0
		end
	else
		snd=nil
		math.randomseed(os.time())
		rand=math.random(1,#mp3)
		snd = sound.load(mp3[rand])
		data = sound.getid3(mp3[rand])
		mode_data = 0
		play = 0
	end
end

function infomusic()
 	---Active l'affichage supplémentaire des changements-----
 	if buttons.r then
 		mode_data = 0
 	end
 	----------------------------------------------------------
	if mode_data == 0 then
		datatime:start()

			scroll_data = screen.print(scroll_data,210,l_info[1].." "..data.album,0.7,color.white,color.black,__SLEFT,screen.textwidth(l_info[1].." "..data.album,0.7))
			screen.print(scroll_data,230,l_info[2].." "..data.title,0.7,color.white,color.black,__SLEFT,screen.textwidth(l_info[2].." "..data.title,0.7))
			screen.print(scroll_data,250,l_info[3].." "..data.artist,0.7,color.white,color.black,__SLEFT,screen.textwidth(l_info[3].." "..data.artist,0.7))
		
		
		if datatime:time() > 6000 then
			datatime:stop()
			mode_data = 1
			scroll_data = 10
			datatime:reset(0)
		end
	end
	
	
end

function screenitem()
	
	--Affiche les items dans le jeu---


		if sitem[additem].statut == false and kritem:time() > 8000 and pause == false then--Ajoute des items sur le terrain
			kritem:reset(0)--reset des 5 secondes
			--Chance d'avoir tel ou tel item ^^--
			zaya = math.random(1,14)
			if zaya == 1 then
				sitem[additem].type = 1--Coeur
			elseif zaya == 2 then
				sitem[additem].type = 2--Etoile
			elseif zaya == 3 or zaya == 4 or zaya == 5 then
				sitem[additem].type = 4--Hamburger
			elseif zaya == 6 or zaya == 7 then
				sitem[additem].type = 3--Freeze
			elseif zaya == 8 or zaya == 9 or zaya == 10 then
				sitem[additem].type = 5--Patin
			else
				sitem[additem].type = 0--Sinon éclair
			end
			zaya = nil
			-------------------------------------
			
			sitem[additem].statut = true
			sitem[additem].x = math.random(0,464)
			sitem[additem].y = math.random(44,257)
		end
	


	
	for i=1,10 do
		
		
		
		if sitem[i].statut == true then
			
			image.blitsprite(item,sitem[i].x,sitem[i].y,sitem[i].type)
			
			if x >= sitem[i].x - 10 and x <= sitem[i].x+10 and y >= sitem[i].y-10 and y <= sitem[i].y+10 then--Pour attraper les items
				sitem[i].statut = false
				
				if sitem[i].type == 0 then--0 Eclair, 1 coeur,2 étoile, 3 freeze, 4 hamburger, 5 patin
					eclair = 100
					sound.play(hbfsn[7],2)--POWER
				end
				if sitem[i].type == 1 then
					vie = 100
					sound.play(hbfsn[6],2)--DOIT
				end
				if sitem[i].type == 2 then
					bonus.star:start()
					sound.play(hbfsn[4],2)--STRONGER
				end
				if sitem[i].type == 3 then
					bonus.freeze:start()
					sound.play(hbfsn[1],2)--HARDER
				end
				if sitem[i].type == 4 then
					bonus.hamburger:start()
					sound.play(hbfsn[2],2)--BETTER
				end
				if sitem[i].type == 5 then
					bonus.patin:start()
					sound.play(hbfsn[3],2)--FASTER
				end
			end

		end
		
		
		--------Action des Bonus-----
		--HAMBURGER
		if bonus.hamburger:time() > 2 then
				policaie = 1
			if bonus.hamburger:time() > 5000 then
				policaie = 0
				bonus.hamburger:reset(0)
				bonus.hamburger:stop()
			end
		end
		--ETOILE
		if bonus.star:time() > 2 then
				policaie = 1
				eclair = 100
				vie = 100
			if bonus.star:time() > 5000 then
				policaie = 0
				bonus.star:reset(0)
				bonus.star:stop()
			end
		end
		--FREEZE !!!
		if bonus.freeze:time() > 2 then
				policaie = 2
			if bonus.freeze:time() > 5000 then
				policaie = 0
				bonus.freeze:reset(0)
				bonus.freeze:stop()
			end
		end
		--VITESSE !!
		if bonus.patin:time() > 2 then
			vivi = 2
			if bonus.patin:time() > 5000 then
				vivi = 0
				bonus.patin:reset(0)
				bonus.patin:stop()
			end
		end
		----------------
		
	end
end

function trucky()--Affiche le camion et le gère
	if camion.party == 2 then--Activation camion !
		camion.statut = 1
	end
	
	if x >= camion.x and x <= camion.x+30 and y >= camion.y and y <= camion.y+20 and pause == false then--Si frappé par le camion, je souffre
		aie = 1
		vie = vie - 5
		y = y+10
	else
		aie = skin
	end
	
	if camion.statut > 0 then
		image.blit(truck,camion.x,camion.y)
	end
	if camion.statut == 1 then
		if camion.pos == "droite" then
			camion.x = camion.x + 4
		else
			camion.x = camion.x - 4
		end
		if camion.x >= 240 and camion.pos == "droite" or camion.x <= 240 and camion.pos == "gauche" then
			camion.statut = 2
			camion.party = 0
			camion.time:start()
		end
	elseif camion.statut == 2 then
		if camion.time:time() > 2000 then
			camion.time:reset(0)
			camion.time:stop()
			camion.statut = 3
		end
	elseif camion.statut == 3 then
		if camion.pos == "droite" then
			camion.x = camion.x + 4
		else
			camion.x = camion.x - 4
		end
		if camion.x >= 500 then
			camion.statut = 0
			if camion.pos == "droite" then
				camion.pos = "gauche"
			else
				camion.pos = "droite"
			end 
			camion.y = math.random(70,200)
			image.fliph(truck)	
		end
	end
end


function level()
	--Gère le nombre de policier, l'XP, l'énergie et la barre de stat, les combos, la pause et les trophées
	
	
	
	--------COMBO----------
	if combo > 2 and comboter:time() > 2 then
		screen.print(x-5,y-5,"Combo X "..combo)
	end
	
	if comboter:time() > 5000 then
		comboter:reset(0)
		comboter:stop()
		if combo > 2 then
			score = score + (combo*10)
		end
		combo = 0
	end
	
	---------XP-----------
	if xp > 100*niv then
		niv = niv + 1
		xp = 0
	end
	----------------------
	
	--------Eclair et Pause--------
	if pause == false then
		eclair = eclair - 0.05
		counter:start()
		kritem:start()
		if bonus.patin:time() > 2 then
			bonus.patin:start()
		end
		if bonus.freeze:time() > 2 then
			bonus.freeze:start()
		end
		if bonus.hamburger:time() > 2 then
			bonus.hamburger:start()
		end
		if bonus.star:time() > 2 then
			bonus.star:start()
		end
	else
		draw.fillrect(0,0,480,272,pause_color)
		screen.print(240-screen.textwidth(l_pause),136,l_pause,1.0,color.white,nil_color)
		counter:stop()
		kritem:stop()
		if bonus.patin:time() > 2 then
			bonus.patin:stop()
		end
		if bonus.freeze:time() > 2 then
			bonus.freeze:stop()
		end
		if bonus.hamburger:time() > 2 then
			bonus.hamburger:stop()
		end
		if bonus.star:time() > 2 then
			bonus.star:stop()
		end
	end
	if eclair > 100 then
		eclair = 100
	end
	----------------------
	
	
	-------Affichage de la barre de state-------
	if x > 11 and x < 146 and y > 11 and y < 45 then
		image.blitsprite(barre,334,11,typy-1)
		draw.line(374,15,374+vie/coefdiv,15,color.black)--barre noir du dessus
		draw.fillrect(374,16,vie/coefdiv,1,red[1])--Vie
		draw.fillrect(374,17,vie/coefdiv,2,red[2])--Vie
		draw.line(374,19,374+vie/coefdiv,19,color.black)--barre noir du dessous
		draw.line(374+vie/coefdiv,16,374+vie/coefdiv,19,color.black)--barre noir du côté
		if eclair > 0 then
			draw.line(374,25,374+eclair/coefdiv,25,color.black)--barre noir du dessus
			draw.fillrect(374, 26,eclair/coefdiv,1,yellow[1])--Eclair
			draw.fillrect(374, 27,eclair/coefdiv,2,yellow[2])--Eclair
			draw.line(374,29,374+eclair/coefdiv,29,color.black)--barre noir du dessous
			draw.line(375+eclair/coefdiv,26,375+eclair/coefdiv,29,color.black)--barre noir du côté
		end
		if xp > 0 then
			draw.line(374,35,374+(xp/niv)/coefdiv,35,color.black)--barre noir du dessus
			draw.fillrect(374, 36,(xp/niv)/coefdiv,1,blue[1])--Xp
			draw.fillrect(374, 37,(xp/niv)/coefdiv,2,blue[2])--Xp
			draw.line(374,39,374+(xp/niv)/coefdiv,39,color.black)--barre noir du dessous
			draw.line(374+(xp/niv)/coefdiv,36,374+(xp/niv)/coefdiv,39,color.black)--barre noir du côté
		end
	else
		image.blitsprite(barre,11,11,typy-1)
		draw.line(51,15,51+vie/coefdiv,15,color.black)--barre noir du dessus
		draw.fillrect(51,16,vie/coefdiv,1,red[1])--Vie
		draw.fillrect(51,17,vie/coefdiv,2,red[2])--Vie
		draw.line(51,19,51+vie/coefdiv,19,color.black)--barre noir du dessous
		draw.line(51+vie/coefdiv,16,51+vie/coefdiv,19,color.black)--barre noir du côté
		if eclair > 0 then
			draw.line(51,25,51+eclair/coefdiv,25,color.black)--barre noir du dessus
			draw.fillrect(51,26,eclair/coefdiv,1,yellow[1])--Eclair
			draw.fillrect(51,27,eclair/coefdiv,2,yellow[2])--Eclair
			draw.line(51,29,51+eclair/coefdiv,29,color.black)--barre noir du dessous
			draw.line(51+eclair/coefdiv,26,51+eclair/coefdiv,29,color.black)--barre noir du côté
		end
		if xp > 0 then
			draw.line(51,35,51+(xp/niv)/coefdiv,35,color.black)--barre noir du dessus
			draw.fillrect(51, 36,(xp/niv)/coefdiv,1,blue[1])--Xp
			draw.fillrect(51, 37,(xp/niv)/coefdiv,2,blue[2])--Xp
			draw.line(51,39,51+(xp/niv)/coefdiv,39,color.black)--barre noir du dessous
			draw.line(51+(xp/niv)/coefdiv,36,51+(xp/niv)/coefdiv,39,color.black)--barre noir du côté
		end
	end
	--------------------------------------------
	
	
	----------------Looser----------------------
	if vie < 0 then
		x=100
		y=100
		aie = skin
		policaie = 0--1=ouille/2=freeze
		polimen = 2
		vie = 100
		vivi = 0
		eclair = 100
		statut = "bas"
		alert = 0
		for i = 1,8 do--Reset la position aléatoire policier
			zyui = math.random(1,4)--Haut,Droite,Bas,Gauche
			if zyui == 1 then
				police[i].x = math.random(0,480)
				police[i].y = -50
			elseif zyui == 2 then
				police[i].x = 530
				police[i].y = math.random(0,272)
			elseif zyui == 3 then
				police[i].x = math.random(0,480)
				police[i].y = 322
			elseif zyui == 4 then
				police[i].x = -50
				police[i].y = math.random(0,272)
			end
			police[i].ratio = 1
			police[i].statut = "bas"
			police[i].strat = "normal"
		end
		additem = 1--Reset des items sur le sol
		jailedroit = 0
		pause = false
		sitem = {{},{},{},{},{},{},{},{},{},{}}--Statut des items
		for i = 1,10 do
			sitem[i].x = 0
			sitem[i].y = 0
			sitem[i].statut = false
			sitem[i].type = 0--0 Eclair, 1 coeur,2 étoile, 3 freeze, 4 hamburger, 5 patin
		end
		
		--reset des timers
		bonus.hamburger:reset(0)
		bonus.hamburger:stop()
		bonus.star:reset(0)
		bonus.star:stop()
		bonus.patin:reset(0)
		bonus.patin:stop()
		bonus.freeze:reset(0)
		bonus.freeze:stop()
		kritem:reset(0)
		counter:stop()
		kritem:stop()
		dofile("lang.lua")--On met à jour les variables de langues
		task = 11
	end
	--------------------------------------------
	
	
	-------------PAUSE--------------------------
	if buttons.released.start and pause == false then
		pause = true
	elseif buttons.released.start and pause == true then
		pause = false
	end
	--------------------------------------------
end

function backeffect()
	---CEST LA FETE
	if eclair > 0 then
		for i = 1,5 do
			image.blitsprite(projy,proj[i].x,proj[i].y,i-1)
			 --Projecteur
			 if  pause == false then
				 if proj[i].xva > proj[i].x then
					 proj[i].x = proj[i].x + 1
				elseif proj[i].xva < proj[i].x then 
					proj[i].x = proj[i].x - 1
				elseif proj[i].yva > proj[i].y then
					proj[i].y = proj[i].y + 1
				elseif proj[i].yva < proj[i].y then
					proj[i].y = proj[i].y - 1
				elseif proj[i].xva == proj[i].x and proj[i].yva == proj[i].y then
					proj[i].xva = math.random(0,480)
					proj[i].yva = math.random(0,272)
				end
			end
		end		
	end	
end

function save()
	filesave = io.open("SAVE.Z","w")
	filesave:write("hightscore = "..hightscore.."\nxp = "..xp.."\nniv = "..niv.."\nhighttime = "..highttime.."\ntypy = "..typy.."\nskin = "..skin.."\nhightkill = "..hightkill.."\nfond = "..fond)
	filesave:close()
end

function snow()
	--Function by psgarsenal
	for i = 1, #table_meteo do
		draw.line(table_meteo[i].x,table_meteo[i].y,table_meteo[i].x+1,table_meteo[i].y+1,color.white)--La neige...simple pixel...	
		table_meteo[i].x = table_meteo[i].x - .25
		table_meteo[i].y = table_meteo[i].y + math.random(2,4)
		if table_meteo[i].x < 0 or table_meteo[i].y > 271 then
			table_meteo[i] = {x=math.random(0,479), y=0}
		end
	end		
end

function party()
	if event == 12 then
		if statut == "droite" or statut == "haut" then
			image.blitsprite(nowel,x,y-6,0)
		else
			image.blitsprite(nowel,x,y-6,1)
		end
		snow()
	end
end