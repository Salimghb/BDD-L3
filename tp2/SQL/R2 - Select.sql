SELECT date_format(dateOperation,'%d/%m/%y') AS dateOperation, libelleOperation, montantOperation, typeOperation

FROM Operation

JOIN Compte
ON Compte.numCompte = Operation.numComptePivot

WHERE 	MONTH (dateOperation) = '12' 
AND 	YEAR (dateOperation) = '2016'
AND  	(typeOperation = 'Crédit'
OR 		typeOperation = 'Débit immédiat')
AND 	Compte.numClient = '860313'

ORDER BY dateOperation;