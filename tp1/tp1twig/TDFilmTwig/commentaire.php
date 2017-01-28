<?php

require_once("model/instancierTwig.php");

require_once("model/dbconnect.php");
$connexion = dbconnect();

require_once("model/get_filmAll.php");
$films = get_filmAll($connexion);

require_once("model/get_acteurAll.php");
$acteurs = get_acteurAll($connexion);

require_once("model/get_commentaireAll.php");
$commentaires = get_commentaireAll($connexion);

require_once("model/add_commentaire.php");

$OCommentaire = new Commentaire;
$preparation = $OCommentaire -> prepare_commentaire($connexion);

$template = $twig -> loadTemplate ('commentaire.html.twig');
echo $template -> render(
  array(
    'films'=> $films,
    'acteurs'=> $acteurs,
    'commentaires' => $commentaires,
    'GET' => $_GET,
    'POST' => $_POST,
    'OCommentaire' => $OCommentaire,
    'preparation' => $preparation

  ));
