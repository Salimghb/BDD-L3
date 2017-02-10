<?php

class client{

//TYPES
    private $numClient;
    private $nomClient;
    private $prenomClient;
    private $adresse;
    private $numTelephone;

//CONSTRUCTEUR
    public function __construct(array $donnees) {
        $this->hydrate($donnees);
    }

//GETTERS
    public function getNumClient()
    {
        return $this->numClient;
    }

    public function getNomClient()
    {
        return $this->nomClient;
    }

    public function getPrenomClient()
    {
        return $this->prenomClient;
    }

    public function getAdresse()
    {
        return $this->adresse;
    }

    public function getNumTelephone()
    {
        return $this->numTelephone;
    }

//SETTERS

    public function setNumClient(String $numClient)
    {
        $this->numClient=$numClient;
    }

    public function setNomClient(String $nomClient)
    {
        $this->nomClient=$nomClient;
    }

    public function setPrenomClient(String $prenomClient)
    {
        $this->prenomClient=$prenomClient;
    }

    public function setAdresse(String $adresse)
    {
        $this->adresse=$adresse;
    }

    public function setNumTelephone(String $numTelephone)
    {
        $this->numTelephone=$numTelephone;
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
}