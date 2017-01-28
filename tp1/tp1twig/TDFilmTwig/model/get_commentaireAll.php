<?php

function get_commentaireAll($connexion) {

  $requete = <<<SQL
  SELECT auteur, contenu,idFilm,
  DATE_FORMAT(datePost,"%d/%m/%Y à %Hh%imin%ss") AS datePost
  FROM Commentaire
SQL;

  $resultat = $connexion->prepare($requete);
  $resultat->execute();

  $commentaires = $resultat->fetchAll();

  return $commentaires;
}
