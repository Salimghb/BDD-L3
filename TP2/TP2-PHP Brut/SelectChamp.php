<?php
require_once ('connect.php');

function getConnect(){
	$connexion=new PDO('mysql:host='.SERVEUR.';dbname='.BDD,USER,PASSWORD);
	$connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$connexion->query('SET NAMES UTF8');
	return $connexion;
}

function SelectChamp($table, $attribut){
	
//CONNEXION BDD
	$connexion=getConnect();

//REQUETE
	$requete =" SELECT ".$attribut." FROM ". $table ." ORDER BY " .$attribut;
	$resultat = $connexion->query($requete);

//REMPLISSAGE LISTE DEROULANTE
	$listeDer = "<select name='".$attribut."'>";
	while ($ligne = $resultat->fetch(PDO::FETCH_OBJ)){
		$listeDer .="<option value='".$ligne->$attribut."' class='param'>".$ligne->$attribut."</option>";
	}
	$listeDer .= "</select><br>";

//RETURN
	return $listeDer;
}