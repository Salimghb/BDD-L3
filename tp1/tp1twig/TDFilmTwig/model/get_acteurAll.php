<?php

function get_acteurAll($connexion) {

  $requete = <<<SQL
  SELECT nom, prenom, Acteur.idFilm
  FROM Acteur
  JOIN Artiste ON idActeur = Artiste.id
SQL;

  $resultat = $connexion->prepare($requete);
  $resultat->execute();

  $acteurs = $resultat->fetchAll();

  return $acteurs;
}
