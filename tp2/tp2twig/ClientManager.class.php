<?php

require_once ('Connect.php');

class FormulaireClientManager {

	private $connexion;

	public function __construct($connexion) {
		$this->setConnexion($connexion);
	}

	public function setConnexion(PDO $connexion) {
		$this->connexion = $connexion;
	}

	public function add(Client $clt) {
		$requete = <<<SQL
		INSERT INTO client (numClient, nomClient, prenomClient, adresse, numTelephone)
		VALUES ($clt->getNumClient(),
			$clt->getNomClient()),
		$clt->getPrenomClient(),
		$clt->getAdresse(),
		$clt->getNumTelephone())
SQL;

	$q = $this->connexion->query($requete);
}
}