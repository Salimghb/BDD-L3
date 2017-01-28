<?php

function get_filmAll($connexion) {

  $requete = <<<SQL
  SELECT Film.id, titre,
  DATE_FORMAT(dateSortie,"%d/%m/%Y") AS dateSortie,
  genre, origine, resume,
  prenom, nom
  FROM Film JOIN Artiste ON Artiste.id = idMES
  ORDER BY dateSortie DESC
SQL;

  $resultat = $connexion->prepare($requete);
  $resultat->execute();

  $films = $resultat->fetchAll();

  return $films;
}
