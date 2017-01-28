<?php

require_once("model/instancierTwig.php");

require_once("model/dbconnect.php");
$connexion = dbconnect();

require_once("model/get_filmAll.php");
$films = get_filmAll($connexion);

require_once("model/get_acteurAll.php");
$acteurs = get_acteurAll($connexion);

$template = $twig -> loadTemplate ('index.html.twig');
echo $template -> render(
  array(
    'films'=> $films,
    'acteurs'=> $acteurs
  ));
