# http://film-bien-a-voir.skyrock.com/
# -----------------------------------------------------------------
#       TABLE : Artiste
# -----------------------------------------------------------------
INSERT INTO Artiste (id, prenom, nom) VALUES
 (1, 'James', 'Cameron')
,(2, 'Sigourney', 'Weaver')
,(3, 'Zoe', 'Saldana')
,(4, 'Gary', 'Ross')
,(5, 'Jennifer', 'Lawrence')
,(6, 'Josh', 'Hutcherson')
;

# -----------------------------------------------------------------
#       TABLE : Film
# -----------------------------------------------------------------
INSERT INTO Film (id, idMES, titre, dateSortie, genre, origine, resume) VALUES
 (1, 1, 'Avatar', '2009-12-16','Aventure / Science-Fiction', 'Américain'
	,'Malgré sa paralysie, Jake Sully, un ancien marine immobilisé dans un fauteuil roulant, est resté un combattant au plus profond de son être. Il est recruté pour se rendre à des années-lumière de la Terre, sur Pandora, où de puissants groupes industriels exploitent un minerai rarissime destiné à résoudre la crise énergétique sur Terre.')
,(2, 4, 'Hunger Games', '2012-03-21','Action / Drame / Science-Fiction', 'Américain'
	,'Chaque année, dans les ruines de ce qui était autrefois l''Amérique du Nord, le Capitole, l''impitoyable capitale de la nation de Panem, oblige chacun de ses douze districts à envoyer un garçon et une fille - les "Tributs" - concourir aux Hunger Games. A la fois sanction contre la population pour s''être rebellée et stratégie d''intimidation de la part du gouvernement, les Hunger Games sont un événement télévisé national au cours duquel les tributs doivent s''affronter jusqu''à la mort. L''unique survivant est déclaré vainqueur.')
;

# -----------------------------------------------------------------
#       TABLE : Acteur
# -----------------------------------------------------------------
INSERT INTO Acteur (idFilm, idActeur) VALUES
 (1, 2)
,(1, 3)
,(2, 5)
,(2, 6)
;

# -----------------------------------------------------------------
#       TABLE : Commentaire
# -----------------------------------------------------------------
INSERT INTO Commentaire (id, idFilm, auteur, datePost, contenu) VALUES
 (1, 1, '@jaimelecinema', '2014-02-20 09:26:00'
	, 'Impossible de ne pas aimer ce film fantastique rempli de couleurs et qui donne envie de s''évader. J''ai été absorbée par ce film, de telle sorte que j''ai eu l''impression que mon esprit a voyagé jusqu''à Pandora. :)')
,(2, 1, '@TheBlueQueens', '2014-11-19 21:31:00'
	, 'J''ai son livre et son DVD et personnellement je ne regrette pas de l''avoir achetée.')
,(3, 1, '@folle2cinema', '2014-12-05 13:00:00'
	, 'Je suis entièrement d''accord avec ta note ! Je suis allée voir ce film à deux reprises et je ne le regrette pas. Cameron a créé un univers grandiose et fantastique dans lequel le spectateur veut bien vivre…')
,(4, 1, '@Visiteur', '2016-01-11 19:30:00'
	, 'Salut,\nComme je suis fan du cinéaste James Cameron, je n''ai pas manqué la sortie d''Avatar ! Ce dernier est fabuleux. Je dois admettre que le jeu des acteurs, ainsi que les effets spéciaux sont irréprochables.')
,(5, 2, '@Visiteur', '2013-05-18 17:23:00'
	, '10/10 !')
,(6, 2, '@Visiteur', '2013-07-30 21:42:00'
	, 'film parfait..♥')
,(7, 2, '@Visiteur', '2015-02-02 18:22:00'
	, 'Bonjour,\nLe premier volet d''Hunger Games dévoile un jeu cruel. J''avoue que l''histoire ne m''a pas trop accroché !')
,(8, 2, '@Visiteur', '2015-06-10 22:21:00'
	, 'Salut,\nLe premier chapitre d''Hunger Games est mon préféré. Je trouve que le personnage de Jennifer Lawrence est très courageux dans cet opus.')
;

