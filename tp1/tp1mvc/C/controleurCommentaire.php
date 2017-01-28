<?php
require_once('M/modele.php');
require_once('V/commentaireVue.php');

function CtlCommentaire($idfilm){
	afficherFormulaire($idfilm);
	afficherFilms(getFilm($idfilm));
	afficherCommentaires(getCommentaires($idfilm));
}

function CtlAjouterCommentaire($idfilm,$login,$message){
	if (!empty($login) && !empty($message)) {
		ajouterCommentaire($idfilm,$login,$message);
		CtlCommentaire($idfilm);
	}
	else {
		throw new Exception("Login ou message invalide"); 
	}
}

function CtlErreur($e){
	afficherErreur($e) ;
}