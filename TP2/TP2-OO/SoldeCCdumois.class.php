<?php

class soldeccdumois{

//ATTRIBUTS
	private $numCompte;
	private $debutMois;
	private $soldeAReporter;

//CONSTRUCTEUR
	public function __construct(array $donnees) {
		$this->hydrate($donnees);
	}

//GETTERS
	public function getNumCompte()
	{
		return $this->numCompte;
	}

	public function getDebutMois()
	{
		return $this->debutMois;
	}

	public function getSoldeAReporter()
	{
		return $this->soldeAReporter;
	}
	
//SETTERS

	public function setNumCompte(String $numCompte)
	{
		$this->numCompte=$numCompte;
	}

	public function setDebutMois($debutMois)
	{
		if ($this->is_date ($debutMois, 'Y-m-d')){
			$this->debutMois=$debutMois;
		}
	}

	public function setSoldeAReporter(float $soldeAReporter)
	{
		$this->soldeAReporter=$soldeAReporter;
	}

//HYDRATE
	public function hydrate(array $donnees) {
		foreach ($donnees as $key => $value){
			$method = 'set' . ucfirst($key);
			if (method_exists($this, $method)){
				$this->$method($value);
			}
		}
	}

//VERIFICATION DATE
	private function is_date ($date,$format='Y-m-d'){
		$d=date_create_from_format($format,$date);
		return ($d && $d->format($format)==$date);
	}
}