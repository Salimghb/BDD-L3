SELECT nomClient, prenomClient,
		 Compte.numCompte,
		  decouvert,
		   soldeAReporter,
		    numCB

FROM Client 

JOIN Compte
ON Client.numClient = Compte.numClient

JOIN CompteCourant
ON Compte.numCompte = CompteCourant.numCompte

JOIN SoldeCCDebutMois
ON Compte.numCompte = SoldeCCDebutMois.numCompte

JOIN CarteBancaire
ON Compte.numCompte = CarteBancaire.numCCSupport

WHERE Client.numClient = '860313' 
AND CarteBancaire.CodeTypeCB = 'MC'
AND SoldeCCDebutMois.debutMois = '2016-12-01';