<?php

function afficherFilms($listeFilms){
	$contenu='';
	foreach ($listeFilms as $ligne){
		$id=$ligne->id;
		$contenu.=<<<HTML
		<div class = caracfilm> 
			<h2><b>$ligne->titre</b> - <i>Sortie le $ligne->datesortie - Réalisé par $ligne->Prenom $ligne->Nom</i> </h2>
		</div>

		<div class = resumeFilm>
			<p><b>Film   : </b> $ligne->Origine</p>
			<p><b>Genre  : </b> $ligne->Genre</p>
			<p><b>Résumé : </b> $ligne->Resume</p>
			<a href=frontalcommentaire.php?id=$id>Commentaires</a>
		</div>
HTML;
	}
	require_once('accueilGabarit.php');
}

function afficherErreur($e){
	$contenu = <<<HTML
	<p>Erreur dans $e->getFile() Ligne : $e->getLine()  : $e->getMessage()</p>
	<p><a href="accueil.php"/> Revenir à l'accueil </a></p>
HTML;
	require_once('accueilGabarit.php');
}