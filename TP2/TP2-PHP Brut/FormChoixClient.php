<?php


//REQUIRE
require_once ('SelectChamp.php');


try{

//HEADER
	$header = <<<HTML
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/style.css">
		<title>Relevé Bancaire</title>
	</head>
	<body>
		<h1>Choix du Client, du Mois de relevé et de la Carte Bancaire</h1>
HTML;

//FOOTER
		$footer=<<<HTML
	</body>
	</html>
HTML;

//CORPS
	$html=$header;

//CONNEXION
	$connexion=getConnect();

//REMPLISSAGE CORPS
	$html .= <<<HTML
		<form action="ReleveMensuel.php">
			<fieldset>
				<legend>Paramètres du relevé mensuel</legend>
HTML;

	$html .= '<label>N° Client</label> : '.SelectChamp('client', 'numClient');

	$html .= '<label>Date Début du mois</label> : <input type="text" name="date" class="param"><br>';

	$html .= '<label>Type Carte Bancaire</label> : '.SelectChamp('typecb', 'libelleTypeCB');
	
	$html .= "
				<input type='submit' value='Valider les données' name='valider'>
				<input type='reset' value='Réinitialiser'>
			</fieldset>
		</form>";


	$html.=$footer;

	echo $html;
}
catch (PDOException $e) {
	echo 'N° : '.$e->getCode().'<br />';
	die ('Erreur : '.$e->getMessage().'<br />');
}