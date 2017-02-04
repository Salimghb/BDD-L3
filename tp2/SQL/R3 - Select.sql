SELECT date_format(dateOperation,'%d/%m/%y') AS dateOperation, libelleOperation, montantOperation

FROM Operation

JOIN Compte
ON Compte.numCompte = Operation.numComptePivot

JOIN CarteBancaire
ON Operation.numCB = CarteBancaire.numCB

WHERE 	MONTH (dateOperation) = '12' 
AND 	YEAR (dateOperation) = '2016'
AND  	typeOperation = 'Débit différé'
AND 	Compte.numClient = '860313'
AND 	CarteBancaire.CodeTypeCB = 'MC'

ORDER BY dateOperation;