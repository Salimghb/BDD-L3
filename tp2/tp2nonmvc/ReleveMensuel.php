<?php
require_once("SelectChamp.php");
$connexion=getConnect();

if (isset($_POST['valider'])
	&& !empty($_POST['date']){

        $numClt=$_POST['numClient'];
        $dateDebutMois=$_POST['date'];
        $typecb=$_POST['libelleTypeCB'];

        $requete = <<<SQL
			SELECT Film.id,titre
			,datesortie
			,Genre,Origine,Resume
			,Prenom,Nom
			FROM film JOIN artiste ON artiste.id = Film.id WHERE Film.id=$identifiantfilm;
SQL;

        $res=$connexion->query($req);
        $res->setFetchMode(PDO::FETCH_OBJ);
        $res->closeCursor();

}
























