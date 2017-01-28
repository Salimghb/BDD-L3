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
	,datesortie
	,Genre,Origine,Resume
	,Prenom,Nom
	FROM film 
	JOIN artiste ON artiste.id = Film.id";
	$resultat = $connexion->query($requete);
	$resultat->setFetchMode(PDO::FETCH_OBJ);
	$listeFilms=$resultat->fetchall();
	$resultat->closeCursor();
	return $listeFilms;
}

function getFilm($idFilm){
	$connexion=getConnect();
	$requete = "
	SELECT Film.id,titre
	,datesortie
	,Genre,Origine,Resume
	,Prenom,Nom
	FROM film 
	JOIN artiste ON artiste.id = Film.id 
	WHERE Film.id=$idFilm";
	$resultat = $connexion->query($requete);
	$resultat->setFetchMode(PDO::FETCH_OBJ);
	$film=$resultat->fetchall();
	$resultat->closeCursor();
	return $film;
}

function ajouterCommentaire($idfilm,$nom,$message){
	$connexion=getConnect();
	$requete="
	INSERT INTO 'commentaire'('idFilm', 'auteur', 'datePost', 'contenu') 
	VALUES ($idfilm,'$nom',NOW(),'$message')";
	$resultat=$connexion->query($requete);
	$resultat->setFetchMode(PDO::FETCH_OBJ);
	$resultat->closeCursor();
}

function getCommentaires($idfilm) {
	$connexion=getConnect();
	$requete ="
	SELECT auteur, date_format (datepost,'%e/%m/%y à %kh%imin%ssec ') AS datepost, contenu 
	FROM commentaire 
	WHERE Commentaire.idFilm=$idfilm";
	$resultat = $connexion->query($requete);
	$resultat->setFetchMode(PDO::FETCH_OBJ);
	$listeCommentaires=$resultat->fetchall();
	$resultat->closeCursor();
	return $listeCommentaires;
}
