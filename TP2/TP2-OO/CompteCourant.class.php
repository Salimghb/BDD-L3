<?php

class comptecourant{

//TYPES
	private $decouvert;
	private $numCompte;
	private $dateOuverture;
	private $depotInitial;

//CONSTRUCTEUR
	public function __construct(array $donnees) {
		$this->hydrate($donnees);
	}

//GETTERS
	public function getNumCompte()
	{
		return $this->numCompte;
	}

	public function getDecouvert()
	{
		return $this->decouvert;
	}

	public function getDateOuverture()
	{
		return $this->dateOuverture;
	}

	public function getDepotInitial()
	{
		return $this->depotInitial;
	}

//SETTERS

	public function setDecouvert(String $decouvert)
	{
		$this->decouvert=$decouvert;
	}

	public function setNumCompte(String $numCompte)
	{
		$this->numCompte=$numCompte;
	}

	public function setDateOuverture($dateOuverture)
	{
		if ($this->is_date ($dateOuverture, 'Y-m-d')){
			$this->dateOuverture=$dateOuverture;
		}
	}

	public function setDepotInitial(float $depotInitial)
	{
		$this->depotInitial=$depotInitial;
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