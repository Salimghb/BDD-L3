<?php

require_once ('connect.php');

function getConnect(){
	$connexion=new PDO('mysql:host='.SERVEUR.';dbname='.BDD,USER,PASSWORD);
	$connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$connexion->query('SET NAMES UTF8');
	return $connexion;
}

function getFilms(){
	$connexion=getConnect();
	$requete = "
	SELECT Film.id,titre
	,date_format(datesortie,\"%d/%m/%Y\") as datesortie
	,genre,origine,resume
	,prenom,nom
	FROM film 
	JOIN artiste ON artiste.id = Film.id";
	$resultat = $connexion->query($requete);
	$listeFilms=$resultat->fetchall();
	$resultat->closeCursor();
	return $listeFilms;
}


function getActeurs() {
	$connexion=getConnect();
	$requete = "
	SELECT nom, prenom, Acteur.idFilm
	FROM Acteur
	JOIN Artiste ON idActeur = Artiste.id";
	$resultat = $connexion->query($requete);
	$Acteurs=$resultat->fetchall();
	$resultat->closeCursor();
	return $Acteurs;
}

function ajouterCommentaire($idfilm,$nom,$message){
	$connexion=getConnect();
	$requete="
	INSERT INTO Commentaire(idFilm,auteur,datePost,contenu)
	VALUES ($idfilm,'$nom',NOW(),'$message')";
	$resultat=$connexion->query($requete);
	$resultat->closeCursor();
}

function getCommentaires() {
	$connexion=getConnect();
	$requete ="
	SELECT auteur, idFilm, date_format (datepost,'%d/%m/%y à %kh%imin%ssec ') AS datepost, contenu 
	FROM commentaire";
	$resultat = $connexion->query($requete);
	$listeCommentaires=$resultat->fetchall();
	$resultat->closeCursor();
	return $listeCommentaires;
}
