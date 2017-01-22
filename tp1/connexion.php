<?php
try{
	require_once('connect.php');
	$connexion=new PDO('mysql:host='.SERVEUR.';dbname='.'tp_psi1',USER,PASSWORD);
	$connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$connexion->query("SET NAMES UTF8");
}
catch (PDOException $e) {
	echo 'N° : '.$e->getCode().'<br />';
	die ('Erreur : '.$e->getMessage().'<br />');
}