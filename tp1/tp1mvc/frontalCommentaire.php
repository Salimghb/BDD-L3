<?php
require_once('C/controleurCommentaire.php');

		$id=$_GET['id'];
		if (isset($_POST['envoyer'])){ 
			$login=$_POST['login'];
			$message=$_POST['message'];
			CtlAjouterCommentaire($_GET['id'],$login,$message);  
		}
		else CtlCommentaire($_GET['id']); 
	
