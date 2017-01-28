<?php
//CONNEXION BDD
require_once('connexion.php');
try{
//HEADER
	$header = <<<HTML
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/style.css">

		<title>Films</title>
	</head>
	<body>
		<h1>Mon blog</h1>
HTML;
//FOOTER
		$footer=<<<HTML
	</body>
	</html>
HTML;
//CORPS
	$html=$header."<h2>Liste des films</h2>";
//SQL 
	$requete = "SELECT Film.id,titre
	,datesortie
	,genre,origine,resume
	,prenom,nom
	FROM film JOIN artiste ON artiste.id = Film.id";
	$resultat = $connexion->query($requete);
//REMPLISSAGE CORPS
	while ($ligne = $resultat->fetch(PDO::FETCH_OBJ)):
		$id=$ligne->id;
	$html.=<<<HTML
	<div class= caracfilm>

		<h2><b>$ligne->titre</b> - <i>Sortie le $ligne->datesortie - Réalisé par $ligne->Prenom $ligne->Nom</i> </h2>
	</div>
	<div class=resumeFilm>

		<p><b>Film   : </b> $ligne->Origine</p>
		<p><b>Genre  : </b> $ligne->Genre</p>
		<p><b>Résumé : </b> $ligne->Resume</p>

		<a href=commentaire.php?id=$id>Commentaires</a>
	</div>

HTML;
	endwhile;

	$resultat->closeCursor();











	$html.=$footer;

	echo $html;
}
catch (PDOException $e) {
	echo 'N° : '.$e->getCode().'<br />';
	die ('Erreur : '.$e->getMessage().'<br />');
}