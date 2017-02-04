
<?php

class operation{

//ATTRIBUTS
	private $codeOperation;
	private $numCB;
	private $numComptePivot;
	private $dateOperation;
	private $libelleOperation;
	private $montantOperation;
	private $typeOperation;

//CONSTRUCTEUR
	public function __construct(array $donnees) {
		$this->hydrate($donnees);
	}

//GETTERS
	public function getNumCB()
	{
		return $this->numCB;
	}

	public function getCodeOperation()
	{
		return $this->codeOperation;
	}

	public function getDateOperation()
	{
		return $this->dateOperation;
	}

	public function getLibelleOperation()
	{
		return $this->libelleOperation;
	}

	public function getMontantOperation()
	{
		return $this->montantOperation;
	}
	public function getNumComptePivot()
	{
		return $this->numComptePivot;
	}
	public function getTypeOperation()
	{
		return $this->typeOperation;
	}
	
//SETTERS

	public function setCodeOperation(String $codeOperation)
	{
		$this->codeOperation=$codeOperation;
	}

	public function setNumCB(String $numCB)
	{
		$this->numCB=$numCB;
	}

	public function setDateOperation($dateOperation)
	{
		if ($this->is_date ($dateOperation, 'Y-m-d')){
			$this->dateOperation=$dateOperation;
		}
	}

	public function setLibelleOperation(String $libelleOperation)
	{
		$this->libelleOperation=$libelleOperation;
	}

	public function setMontantOperation(float $montantOperation)
	{
		$this->montantOperation=$montantOperation;
	}

	public function setNumComptePivot(String $numComptePivot)
	{
		$this->numComptePivot=$numComptePivot;
	}

	public function setTypeOperation(String $typeOperation)
	{
		$this->typeOperation=$typeOperation;
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