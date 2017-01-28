<?php

function afficherFormulaire($idfilm){
	$contenu1 = <<<HTML

	<form method="post" action="./frontalcommentaire.php?id=$idfilm">
		<p>
			<label for="login">Auteur</label>
			<input type="text" name ="login" id="login" />
		</p>
		<p>
			<label for="message">Message</label>
			<input type="text" name="message" id="message" />
		</p>
		<p> 
			<input type="Submit" value="Envoyer" name="envoyer">
		</p>
	</form>

	<h1>Film du blog</h1>
	<a href="./frontalAccueil.php">Retour à la liste des films</a>

HTML;

	require_once('commentaireGabarit.php');
}

function afficherFilms($listeFilms){
	$contenu1='';
	foreach ($listeFilms as $ligne){
		$id=$ligne->id;
		$contenu1.=<<<HTML
		<div class = caracfilm> 
			<h2><b>$ligne->titre</b> - <i>Sortie le $ligne->datesortie - Réalisé par $ligne->Prenom $ligne->Nom</i> </h2>
		</div>

		<div class = resumeFilm>
			<p><b>Film   : </b> $ligne->Origine</p>
			<p><b>Genre  : </b> $ligne->Genre</p>
			<p><b>Résumé : </b> $ligne->Resume</p>
		</div>
HTML;
	}
	require_once('commentaireGabarit.php');
}

function afficherCommentaires($listeCommentaires){
	$contenu1='<h1>Commentaires</h1>' ;
	foreach ($listeCommentaires as $ligne){

		$contenu1.= <<<HTML

		<div class=caracFilm>
			<h2><b>$ligne->auteur</b> - <i>le $ligne->datepost</i> </h2>
		</div>

		<div class=resumeFilm>
			<p> $ligne->contenu </p>
		</div>

HTML;

	}
	require_once('commentaireGabarit.php');
}