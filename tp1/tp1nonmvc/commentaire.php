<?php

require_once('M/modele.php');
try{
  $connexion=getConnect();
  $header = <<<HTML
  <!DOCTYPE html>
  <html>
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/style.css">
    <title>Commentaires</title>
  </head>
  <body>
    <h1>Mon blog</h1>
HTML;
//FOOTER
    $footer=<<<HTML
  </body>
  </html>
HTML;

  $html=$header." <h2>Commentez</h2>";

if (isset($_GET['id'])){



  $identifiantfilm=$_GET['id'];

  $html.=<<<HTML
    <form method="post" action="./commentaire.php?id=$identifiantfilm">
        <p>
          <label for="login">Auteur</label>
          <input type="text" name ="login" id="login" />
        </p>
        <p>
          <label for="message">Message</label>
          <input type="text" name="message" id="message" />
        </p>
        <p> 
          <input type="Submit" value="Envoyer" name="envoyer">
        </p>
     </form>
  <h1>Film du blog</h1>
  <a href="./accueil.php">Retour à la liste des films</a>
HTML;

if (isset($_POST['envoyer'])&& !empty($_POST['login']) && !empty($_POST['message'])){
        $login=$_POST['login'];
        $message=$_POST['message'];
        $req="INSERT INTO `commentaire`(`idFilm`, `auteur`, `datePost`, `contenu`) VALUES ($identifiantfilm,'$login',NOW(),'$message')";
        $res=$connexion->query($req);
        $res->setFetchMode(PDO::FETCH_OBJ);
        $res->closeCursor();
}

//SQL
  $requete = <<<SQL
  SELECT Film.id,titre
  ,datesortie
  ,Genre,Origine,Resume
  ,Prenom,Nom
  FROM film JOIN artiste ON artiste.id = Film.id WHERE Film.id=$identifiantfilm;
SQL;


  $resultat = $connexion->query($requete);
//CARAC DU FILM
  while ($ligne = $resultat->fetch(PDO::FETCH_OBJ)):
    $id=$ligne->id;
    $html.=<<<HTML
    <div class= "caracfilm">

      <h2><b>$ligne->titre</b> - <i>Sortie le $ligne->datesortie - Réalisé par $ligne->Prenom $ligne->Nom</i> </h2>
      <div class="resumeFilm">

        <p><b>Film   : </b> $ligne->Origine</p>
        <p><b>Genre  : </b> $ligne->Genre</p>
        <p><b>Résumé : </b> $ligne->Resume</p>

      </div>
    </div>
HTML;
  endwhile;

$req=<<<SQL
SELECT auteur,date_format(datepost,'%e/%m/%y à %kh%imin%ssec ') AS datepost,contenu FROM commentaire WHERE idFilm=$identifiantfilm
SQL;

  $res=$connexion->query($req);

//COMMENTAIRES
  $html.="<h1>Commentaires</h1>";

  while ($ligne = $res->fetch(PDO::FETCH_OBJ)):
    $html.=<<<HTML
    <div class=caracFilm>
    
        <h2><b>$ligne->auteur</b> - <i>le $ligne->datepost</i> </h2>
        </div>
        <div class=resumeFilm>
        <p> $ligne->contenu </p>
        </div>
HTML;
  endwhile;



  $html.=$footer;

}
  echo $html;


}catch(PDOException $e){
  $msg = 'ERREUR dans ' . $e->getFile() . ' Ligne : ' . $e->getLine() . ' : ' . 
  $e->getMessage() ;
  exit($msg);
}
