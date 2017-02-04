<?php

class cartebancaire{

//ATTRIBUTS
    private $numCB;
    private $numClientDetenteur;
    private $codeTypeCB;
    private $numCCSupport;
    private $dateExpiration;

//CONSTRUCTEUR
    public function __construct(array $donnees) {
        $this->hydrate($donnees);
    }

//GETTERS
    public function getNumCB()
    {
        return $this->numCB;
    }

    public function getNumClientDetenteur()
    {
        return $this->numClientDetenteur;
    }

    public function getCodeTypeCB()
    {
        return $this->codeTypeCB;
    }

    public function getNumCCSupport()
    {
        return $this->numCCSupport;
    }

    public function getDateExpiration()
    {
        return $this->dateExpiration;
    }

//SETTERS

    public function setNumCB(String $numCB)
    {
        $this->numCB=$numCB;
    }

    public function setNumClientDetenteur(String $numClientDetenteur)
    {
        $this->numClientDetenteur=$numClientDetenteur;
    }

    public function setCodeTypeCB(String $codeTypeCB)
    {
        $this->codeTypeCB=$codeTypeCB;
    }

    public function setNumCCSupport(String $numCCSupport)
    {
        $this->numCCSupport=$numCCSupport;
    }

    public function setDateExpiration($dateExpiration)
    {
        if ($this->is_date($dateExpiration, 'Y-m-d')){
            $this->dateExpiration=$dateExpiration;
        }
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