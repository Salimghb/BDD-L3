<?php

require_once("modele/instancierTwig.php");

require_once("modele/modele.php");
$films = getFilms();
$acteurs = getActeurs();
$commentaires = getCommentaires();
echo $twig -> render('commentaire.html.twig',
	array('films'=> $films,
		'acteurs'=> $acteurs,
		'commentaires'=>$commentaires,
		'GET' => $_GET,
		'POST' => $_POST)
	);
