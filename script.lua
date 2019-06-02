--Æ∏∏|Ê|Œ
os.cpu(266)--On augmente un peu le processeur
os.debug()
splash.show()	
splash.show({"img/splash.png","img/cp.png"})	
langage = os.language()--Definie la langue
font.setdefault("DaftFont.pgf")
--VARIABLE DE BASE pour sauvarde
hightscore = 0
highttime = 0
hightkill = 0
score = 0
xp = 0
niv = 1
kill = 0
typy = 1--Choix du perso
skin = 2--Choix du skin
fond = 1
-----------------------------------
if files.exists("SAVE.Z") then --Chargement de la sauvegarde 
	dofile("SAVE.Z")
else
	os.message("Save not found\nSauvegarde non trouvé") 
end
dofile("engine.lua")--Chargement du jeu
dofile("menu.lua")--Chargement des menus
task = 0
step_music = 4
selecteur = 1
selecteurd = 1--deuxième selecteur
--Couleur--
color.loadpalette()
red = {color.new(192,25,35),color.new(175,0,14)}--Vie
yellow = {color.new(255,252,56),color.new(251,196,16)}--Eclair
blue = {color.new(158,197,254),color.new(7,67,191)}--Xp
nil_color = color.new(0,0,0,0)
pause_color = color.new(0,0,0,100)
---Projecteur-----
projy = image.load("img/cercle.png",80,80)
proj = {{},{},{},{},{}}
for i=1,5 do
	proj[i].x = math.random(0,480)
	proj[i].xva = math.random(0,480)
	proj[i].y = math.random(0,272)
	proj[i].yva = math.random(0,272)
end

--Images--
background = {image.load("img/background/default.png"),image.load("img/background/carrelage.png"),image.load("img/background/ombre.png"),image.load("img/background/rainbow.png")}
item = image.loadv("img/item.png",16,15)
barre = image.load("img/barre.png",135,34)
sp_daft = {
	{image.load("img/daft/1/r.png",18,24),image.load("img/daft/1/ori.png",18,24),image.load("img/daft/1/a.png",18,24),image.load("img/daft/1/b.png",18,24),image.load("img/daft/1/c.png",18,24)},
	{image.load("img/daft/2/r.png",18,24),image.load("img/daft/2/ori.png",18,24),image.load("img/daft/2/a.png",18,24),image.load("img/daft/2/b.png",18,24),image.load("img/daft/2/c.png",18,24)}
}

sp_police = {image.loadv("img/police.png",18,24),image.loadv("img/police_r.png",18,24),image.loadv("img/police_f.png",18,24)}
logos = image.load("img/logos.png")
truck = image.loadv("img/truck.png")
-----Les Daft Punk-----
x=100
y=100
level_suit = {{1,2,4,6},{1,3,5,7}}
aie = skin--degats img (1= aie, autre = skin)
statut = "bas"
moving = timer.new()
moving:start()--A mettre au lancement du jeu apres 
--------Camion--------
camion = {x = -100, y=math.random(70,200), statut = 0, pos = "droite", time = timer.new(),party = 0}
camion.time:stop()
--------Polices--------
police = {{},{},{},{},{},{},{},{},{},{}}
for i=1,8 do
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
	police[i].strat = "normal"
	police[i].statut = "bas"
	police[i].ratio = 1
end
straty = {"normal","normal","verti","hori","pause","pause","hori","hori","verti","verti"}
alert = 0--niveau d'alerte
policaie = 0--1=ouille/2=freeze
polimen = 2
polimov = timer.new()
polimov:start()
-----------------Jeu--------------------------
vie = 100
coefdiv = 100/84 -- = 1,19................ Merci PSP :p
vivi = 0--VITESSE
eclair = 100
---------------Item---------------------------
additem = 1
jailedroit = 0
kritem = timer.new()
kritem:stop()
pause = false
sitem = {{},{},{},{},{},{},{},{},{},{}}--Statut des items
for i = 1,10 do
	sitem[i].x = 0
	sitem[i].y = 0
	sitem[i].statut = false
	sitem[i].type = 0--0 Eclair, 1 coeur,2 étoile, 3 freeze, 4 hamburger, 5 patin
end
----------------Les Bonus---------------------
bonus = {hamburger = timer.new(), star = timer.new(),freeze= timer.new() ,patin= timer.new()}
--On se calme les chronos ^^
bonus.hamburger:stop()
bonus.star:stop()
bonus.freeze:stop()
bonus.patin:stop()
----------------COMBO------------------------
comboter = timer.new()
comboter:stop()
combo = 0
--------------TIMER JEU-------------------------
counter = timer.new()
counter:stop()
time = math.floor((counter:time()/1000)/60)..":"..(math.floor(counter:time()/1000)-math.floor((counter:time()/1000)/60)*60)
------------------Sons et Musique---------
hbfsn = {sound.load("wav/harder.mp3"), sound.load("wav/better.mp3"), sound.load("wav/faster.mp3"), sound.load("wav/stronger.mp3"),sound.load("wav/over.mp3"),sound.load("wav/doit.mp3"),sound.load("wav/power.mp3")}

lista = files.listfiles("music/")          --only files
mp3={}
for i=1,#lista do
  if lista[i].ext == "mp3" then             --only mp3s
    table.insert(mp3,lista[i].path)
  end
end

math.randomseed(os.time())
rand=math.random(1,#mp3)
snd = sound.load(mp3[rand])
data = sound.getid3(mp3[rand])
scroll_data = 10
mode_data = 0
datatime = timer.new()
datatime:stop()
cont,play=0,0
y_cred = 30
dofile("lang.lua")--Chargement de la langue
time = os.time()
dateFields = os.date("*t", time)
time = nil
event = dateFields.month
dateFields = nil
nowel = image.load("img/nowel.png",18,16)
table_meteo = {}
for i = 1, 50 do
	table_meteo[i] = {x = math.random(0,479),y = math.random(0,271)}
end

while true do
buttons.read()
time = math.floor((counter:time()/1000)/60)..":"..(math.floor(counter:time()/1000)-math.floor((counter:time()/1000)/60)*60)
image.blit(background[fond],0,0)
soundmusic()--Musique
	if task == 0 then--Menu
		menu()
		backeffect()--Fond avec cercle
	elseif task == 1 then--Jeu
		screenitem()
		move()
		ia()
		trucky()
		level()
		screen.print(10,60,l_board[1]..score.."\n"..l_board[2]..time.."\n"..l_board[3]..kill)--Score, timer(minutes/secondes) et nombre de tués
		backeffect()--Fond avec cercle
	elseif task == 11 then--Loose
		loose()
	elseif task == 2 then
		suit()
	elseif task == 3 then
		credits()
	else
		os.exit()	
	end
party()
infomusic()--Affiche les informations de la musique
screen.flip()--Nettoyage de l'écran
end