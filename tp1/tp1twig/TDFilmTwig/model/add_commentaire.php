<?php

class Commentaire
{
  function prepare_commentaire($connexion) {

    $requete = <<<SQL
    INSERT INTO Commentaire(idFilm,auteur,datePost,contenu)
    VALUES (?,?,?,?)
SQL;

    $preparation = $connexion->prepare($requete);

    return $preparation;
  }

    function add_commentaire($preparation,$idFilm,$auteur,$contenu){
      $preparation-> execute(array($idFilm,$auteur,date('Y-m-d H:i:s'),$contenu));
      return "Votre commentaire a bien été ajouté.";
    }

}
