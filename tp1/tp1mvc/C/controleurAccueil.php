<?php
require_once('M/modele.php');
require_once('V/accueilVue.php');

function CtlAcceuil(){
	$listeFilms=getFilms();
	afficherFilms($listeFilms);
}

function CtlErreur($erreur){
	afficherErreur($erreur) ;
}