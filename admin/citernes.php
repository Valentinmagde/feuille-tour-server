<?php
	
	/*
    * Projet : FEUILLE DE ROUTE MINESUP
    * Code PHP : actions.php (actions page)
    ************************************************
    * Auteur : Valentin Magde,Demasso James,Nebo Djomche Joress
    * E-mails : <valentinmagde@gmail.com>
  */

	/*---Pour permettre à un site de faire des demandes CORS sans utiliser le caractère générique "*" (par exemple, pour activer les informations d'identification), votre serveur doit lire la valeur de l'en-tête Origin de la demande et utiliser cette valeur pour définir Access-Control-Allow-Origin. doit également définir un en-tête Vary: Origin pour indiquer que certains en-têtes sont définis de manière dynamique en fonction de l'origine. ---*/
	header("Access-Control-Allow-Origin: *");
	header("Content-Type: application/json; charset=UTF-8");

	//Inclusion du fichier de la connexion à la base de données
	include('../config/c.php');

	// Modification des données d'une action
	// Contrainte {id}
	if ($_POST['method']=="modif") {
	mysqli_query($con,"UPDATE citernes SET 
			nom = '".addslashes($_POST['nom'])."',
			date_creation = '".addslashes($_POST['datecreation'])."',
			type_citerne = '".addslashes($_POST['typeciterne'])."',
			id_station = '".addslashes($_POST['station'])."'
			WHERE id = '".addslashes($_POST['id'])."'
		") or die(mysqli_error($con));
	echo 1;

	// Création d'une action
	// Données requises {code, denomination, indicateur, programme}
	}elseif($_POST['method']=="creer"){	
	mysqli_query($con,"INSERT INTO citernes SET 
			nom = '".addslashes($_POST['nom'])."',
			date_creation = '".addslashes($_POST['datecreation'])."',
			type_citerne = '".addslashes($_POST['typeciterne'])."',
			id_station = '".$_POST['listestations']."'
		") or die(mysqli_error($con));
	echo 2;

	// Selection de la dernière action en base
	// Contrainte {id}
    }
    elseif($_POST['method']=="suppr") {
		mysqli_query($con,"DELETE FROM citernes WHERE id = '".$_POST['id']."'") or die(mysqli_error($con));
		echo 3;
	}
	// Selection des toutes les données en base
	else{
		$result = mysqli_query($con,"SELECT * FROM citernes") or die(mysqli_error($con));	

			while($row = mysqli_fetch_array($result))
			{
			    $rows[] = $row;
			}
		   //Return result to jTable
			$jTableResult = array();
			$jTableResult = $rows;
			print json_encode($jTableResult);
	}

?>

