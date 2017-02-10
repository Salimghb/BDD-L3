<?php

class typecb{

//ATTRIBUTS
	private $codeTypeCB;
	private $libelleTypeCB;

//CONSTRUCTEUR
	public function __construct(array $donnees) {
		$this->hydrate($donnees);
	}

//GETTERS
	public function getCodeTypeCB()
	{
		return $this->codeTypeCB;
	}

	public function getLibelleTypeCB()
	{
		return $this->libelleTypeCB;
	}
	
//SETTERS

	public function setCodeTypeCB(String $codeTypeCB)
	{
		$this->codeTypeCB=$codeTypeCB;
	}

	public function setLibelleTypeCB(String $libelleTypeCB)
	{
		$this->libelleTypeCB=$libelleTypeCB;
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