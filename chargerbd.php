<?php

    /*
    * Projet : FEUILLE DE ROUTE MINESUP
    * Code PHP : chargebd.php (chargebd page)
    ************************************************
    * Auteur : Valentin Magde,Demasso James,Nebo Djomche Joress
    * E-mails : <valentinmagde@gmail.com>
  */

    /*---Pour permettre à un site de faire des demandes CORS sans utiliser le caractère générique "*" (par exemple, pour activer les informations d'identification), votre serveur doit lire la valeur de l'en-tête Origin de la demande et utiliser cette valeur pour définir Access-Control-Allow-Origin. doit également définir un en-tête Vary: Origin pour indiquer que certains en-têtes sont définis de manière dynamique en fonction de l'origine. ---*/
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");

    //Inclusion des fichiers externes
    //Inclusion du fichier de la connexion à la base de données
    include('config/c.php');

    // Vérification du paramettre k
	if ($_POST['k'] == 1) {
        $bd = "sexes";
    }
    elseif ($_POST['k'] == 2) {
        $bd = "lavages";
    }
    elseif ($_POST['k'] == 3) {
        $bd = "villes";
    }
    elseif ($_POST['k'] == 4) {
        $bd = "pompes";
    }
    elseif ($_POST['k'] == 5) {
        $bd = "stations";
    }
    elseif ($_POST['k'] == 6) {
        $bd = "vidanges";
    }
    elseif ($_POST['k'] == 7) {
        $bd = "categories";
    }
    elseif ($_POST['k'] == 10) {
        $bd = "utilisateurs";
    }
    elseif ($_POST['k'] == 11) {
        $bd = "roles";
    }
    elseif ($_POST['k'] == 13) {
        $bd = "notifications";
    }

    $result = mysqli_query($con,"SELECT * FROM ".$bd) or die(mysqli_error($con));
    $rows = array();
	while($row = mysqli_fetch_array($result))
	{
	    $rows[] = $row;
	}
   //Return result to jTable
	$jTableResult = array();
	$jTableResult = $rows;
	print json_encode($jTableResult);

?>