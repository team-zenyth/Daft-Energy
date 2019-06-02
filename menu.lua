function menu()

	image.blitsprite(sp_daft[typy][skin],100,100,9)
	
	
	screen.print(10,10,l_board[4].." "..l_board[1]..hightscore.."\n\n"..l_board[4].." "..l_board[2]..math.floor((highttime/1000)/60)..":"..(math.floor(highttime/1000)-math.floor((highttime/1000)/60)*60).."\n\n"..l_board[4].." "..l_board[3]..hightkill,0.6,color.white,nil_color)
	
	for i = 1,4 do
		screen.print(150,80+(i*20), l_menu[i],0.8,color.white,nil_color)
	end
	screen.print(135,82+(selecteur*20),">",0.8,color.white,nil_color)
	
		
	if buttons.released.down then
		
		selecteur = selecteur + 1
	end
	if buttons.released.up then
		
		selecteur = selecteur - 1
	end
	if selecteur > 4 then
		selecteur = 1
	end
	if selecteur < 1 then
		selecteur = 4
	end
	if buttons.released.cross then
		
		task = selecteur
		if task == 1 then
		elseif task == 2 then
			selecteurd = typy
			selecteur = (skin-1)
		end
	end
	
	if buttons.right then
		fond = fond + 1
	end
	if buttons.left then
		fond = fond - 1
	end
	if fond > 4 then
	 fond = 1
	end
	if fond < 1 then
		fond = 4
	end
	screen.print(340,10,"< "..l_fond[fond].." >",0.6,color.white,nil_color)
	screen.print(370,260,"Team Zenyth",0.6,color.white,nil_color)
end

function loose()
	backeffect()--Fond avec cercle
	screen.print(20,20,l_loose[1],1.0, color.white,nil_color)
	screen.print(20,45,l_loose[2]..score..".",0.7, color.white,nil_color)
	screen.print(20,60,l_loose[3]..time..".",0.7, color.white,nil_color)
	screen.print(20,75,l_loose[4].." "..kill.." "..l_loose[5],0.7, color.white,nil_color)
	if score > hightscore then--On montre que vous avez fais un meilleur score.
		screen.print(20,100,l_scoring[2],0.8, color.white,nil_color)
	else--Sinon non x)
		screen.print(20,100,l_scoring[1].." "..hightscore..".",0.6, color.white,nil_color)
	end
	if counter:time() > highttime then--On montre que vous avez fais un meilleur temps.
		screen.print(20,120,l_timering[2],0.8, color.white,nil_color)
	else--Sinon non x)
		screen.print(20,120,l_timering[1].." "..math.floor((highttime/1000)/60)..":"..(math.floor(highttime/1000)-math.floor((highttime/1000)/60)*60)..".",0.6, color.white,nil_color)
	end
	if score > hightscore then--On montre que vous avez fais un meilleur score.
		screen.print(20,140,l_killing[2],0.8, color.white,nil_color)
	else--Sinon non x)
		screen.print(20,140,l_killing[1].." "..hightkill..".",0.6, color.white,nil_color)
	end
	screen.print(20,170,l_loose[6],0.8, color.white,nil_color)--Affiche appuyer sur croix
	if buttons.released.cross then
		
		if score > hightscore then--On enregistre le meilleur score
			hightscore = score
		end
		if kill > hightkill then--On enregistre le meilleur kill
			hightkill = kill
		end
		if counter:time() > highttime then
			highttime = counter:time()
		end
		save()
		score = 0
		kill = 0
		counter:reset(0)
		counter:stop()
		task = 0
	end
end

function suit()
	backeffect()--Fond avec cercle
	screen.print(10,10,l_suit[1].." "..l_suit[2][selecteurd].."\n\n"..l_suit[3].." "..niv,0.6,color.white,nil_color)
	if level_suit[selecteur][selecteurd] ~= niv then
		screen.print(10,40,l_suit[4].." "..level_suit[selecteur][selecteurd],0.6,color.white,nil_color)
	end
	draw.fillrect(91,88,36,48,pause_color)--Pour les deux
	draw.fillrect(91,160,36,48,pause_color)--Pour les deux
	
	if selecteur == 1 then
		draw.rect(91,88,36,48,yellow[1])--Selection Daft jaune
		draw.rect(91,160,36,48,color.black)--Pas selectionné le Daft Gris :(
		
		for i=1,4 do
			image.blitsprite(sp_daft[1][i+1],100+(i*41),100,9)--Affichage des deux daft
		end
		
	else
		draw.rect(91,160,36,48,yellow[1])--Selection Daft gris
		draw.rect(91,88,36,48,color.black)--Pas selectionné le Daft Jaune :(
		
		for i=1,4 do
			image.blitsprite(sp_daft[2][i+1],100+(i*41),172,9)--Affichage des deux daft
		end
		
	end
	
	image.blitsprite(sp_daft[1][2],100,100,9)--Affichage des deux daft de bases
	image.blitsprite(sp_daft[2][2],100,172,9)
	
	if selecteur == 1 then
		draw.line(100+(selecteurd*41),130,118+(selecteurd*41),130,yellow[1])
		if typy == selecteur then
			draw.line(100+((skin-1)*41),130,118+((skin-1)*41),130,color.green)
		end
	else
		draw.line(100+(selecteurd*41),202,118+(selecteurd*41),202,yellow[1])
		if typy == selecteur then
			draw.line(100+((skin-1)*41),202,118+((skin-1)*41),202,color.green)
		end
	end
	
	if buttons.right then
		selecteurd = selecteurd + 1
	end
	if buttons.left then
		selecteurd = selecteurd - 1
	end
	if selecteurd > 4 then
		selecteurd = 1
	end
	if selecteurd < 1 then
		selecteurd = 4
	end
	
	if buttons.down then
		selecteur = selecteur + 1
	end
	if buttons.up then
		selecteur = selecteur - 1
	end
	if selecteur > 2 then
		selecteur = 1
	end
	if selecteur < 1 then
		selecteur = 2
	end
	if buttons.cross and level_suit[selecteur][selecteurd] == niv then	
		typy = selecteur
		skin = selecteurd + 1
	end
	
	
	
	if buttons.circle then
		save()
		task = 0
		selecteurd = 1
		selecteur = 1
	end
	
	
end

function credits()
	screen.print(10,y_cred,l_cred,0.6,color.white,nil_color,__ALEFT,470)
	image.blit(logos,0,760+y_cred)
	screen.print(10,850+y_cred,"Daft Energy v1.50")
	
	if buttons.held.down then
		y_cred = y_cred - 2
	elseif buttons.held.up then
		y_cred = y_cred + 2
	else
		y_cred=y_cred-0.2
	end
		
	if buttons.circle then
		
		y_cred = 30
		task = 0
	end
	if y_cred > 30 then
		y_cred = 30
	end
	if y_cred < -600 then
		y_cred = -600
	end
end