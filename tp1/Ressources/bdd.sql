DROP TABLE IF EXISTS Commentaire;

DROP TABLE IF EXISTS Artiste;

DROP TABLE IF EXISTS Film;

DROP TABLE IF EXISTS Acteur;

# -----------------------------------------------------------------------------
#       TABLE : Commentaire
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Commentaire
 (
   id INTEGER NOT NULL AUTO_INCREMENT ,
   idFilm INTEGER NOT NULL  ,
   auteur VARCHAR(32)   ,
   datePost DATETIME   ,
   contenu TEXT   
   , PRIMARY KEY (id) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Artiste
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Artiste
 (
   id INTEGER NOT NULL AUTO_INCREMENT ,
   prenom VARCHAR(32)   ,
   nom VARCHAR(32)   
   , PRIMARY KEY (id) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Film
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Film
 (
   id INTEGER NOT NULL AUTO_INCREMENT ,
   idMES INTEGER NOT NULL  ,
   titre VARCHAR(64)   ,
   dateSortie DATE   ,
   genre VARCHAR(64)   ,
   origine VARCHAR(64)   ,
   resume TEXT   
   , PRIMARY KEY (id) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Acteur
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Acteur
 (
   idFilm INTEGER NOT NULL  ,
   idActeur INTEGER NOT NULL  
   , PRIMARY KEY (idFilm,idActeur) 
 ) 
 comment = "";


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE Commentaire 
  ADD FOREIGN KEY FK_Commentaire_Film (idFilm)
      REFERENCES Film (id) ;


ALTER TABLE Film 
  ADD FOREIGN KEY FK_Film_Artiste (idMES)
      REFERENCES Artiste (id) ;


ALTER TABLE Acteur 
  ADD FOREIGN KEY FK_Acteur_Film (idFilm)
      REFERENCES Film (id) ;


ALTER TABLE Acteur 
  ADD FOREIGN KEY FK_Acteur_Artiste (idActeur)
      REFERENCES Artiste (id) ;

