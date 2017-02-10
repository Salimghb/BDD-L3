<?php

require_once ('Connect.php');

class ClientManager {

	private $connexion;

	public function __construct($connexion) {
		$this->setConnexion($connexion);
	}

	public function setConnexion(PDO $connexion) {
		$this->connexion = $connexion;
	}

	public function getList() {
		$clients = [];

		$requete ="SELECT numClient FROM Client ORDER BY numClient";
		$resultat = $connexion->query($requete);

		while ($ligne = $q->fetch(PDO::FETCH_ASSOC))
		{
			$clients[] = new Client($ligne);
		}

		return $persos;
	}
}