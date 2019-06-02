if langage == "FRENCH" then
l_menu = {"Jouer","Costume","Crédits","Quitter"}
l_loose = {"Vous avez perdu.","Vous avez obtenu un score de","Vous avez fait un temps de","Vous avez tué","policier(s).","Appuyez sur X pour continuer."}
l_scoring = {"Votre meilleur score est de","Nouveau meilleur score !"}
l_killing = {"Votre meilleur nombre de policier tué est de","Nouveau meilleur nombre de tués !"}
l_timering = {"Votre meilleur temps est de","Nouveau meilleur temps !"}
l_board = {"Score : ","Temps : ","Nombre de tués : ","Meilleurs"}
l_pause = "Pause"
l_suit = {"Costume :",{"Classique","Néon","Style","Special"},"Vous etes niveau","Le niveau requis est"}
l_info = {"Album :","Titre :","Artiste :"}
l_fond = {"Normal","Carrelages","Ombre","Fragments"}
dofile("credits.lua")
else--ENGLISH
l_menu = {"Play","Suit","About","Exit"}
l_loose = {"Game Over.","You have a score","You have make a time","You have killed","policemen.","Press X to continue."}
l_scoring = {"Your best score is","New best score !"}
l_killing = {"Your best number of policeman killed is","New best number of killed !"}
l_timering = {"Your best time is","New best time !"}
l_board = {"Score : ","Time : ","Numbers of killed : ","Best"}
l_pause = "Pause"
l_info = {"Album:","Title:","Artist:"}
l_suit = {"Suit:",{"Classic","Neon","Style","Special"},"You are level","The level required is"}
l_fond = {"Normal","Tiles","Shadow","Fragments"}
dofile("about.lua")
end