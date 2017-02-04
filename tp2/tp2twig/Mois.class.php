<?php

class mois {

//ATTRIBUTS
	private $debutMois;

//CONSTRUCTEUR
    public function __construct(array $donnees) {
        $this->hydrate($donnees);
    }

//GETTERS
    public function getDebutMois()
    {
        return $this->debutMois;
    }

//SETTERS
    public function setDebutMois($debutMois)
    {
        if ($this->is_date ($debutMois, 'Y-m-d')){
            $this->debutMois=$debutMois;
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