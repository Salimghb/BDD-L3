<?php

require_once("modele/instancierTwig.php");

require_once("modele/modele.php");
$films = getFilms();
$acteurs = getActeurs();

echo $twig -> render('accueil.html.twig',
	array('films'=> $films, 'acteurs'=> $acteurs)
	);
