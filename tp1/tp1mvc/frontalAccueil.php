<?php
require_once('C/controleurAccueil.php');
try {
	CtlAcceuil();
}
catch(Exception $e) {
	CtlErreur($e);
}