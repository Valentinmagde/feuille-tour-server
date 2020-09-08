<?php

	/*
    * Projet : FEUILLE DE ROUTE MINESUP
    * Code PHP : archive.php (archive page)
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
	
	// Archivage des actions d'un programme
	// Contrainte {id du programme}
	// Valeur == 1
	if ($_POST['method']=="action") {
	mysqli_query($con,"UPDATE action SET 
			archive = '".addslashes($_POST['valeur'])."'
			WHERE id_programme = '".addslashes($_POST['id'])."'
		") or die('erreur1');
	echo 1;

	// Archivage des activités d'un programme
	// Contrainte {id du programme}
	// Valeur == 1
	}elseif($_POST['method']=="activite"){	
	mysqli_query($con,"UPDATE activite,action,programme SET 
			activite.archive = '".addslashes($_POST['valeur'])."',
			programme.archive = '".addslashes($_POST['valeur'])."'
			WHERE activite.id_action = action.id_action
			AND action.id_programme = programme.id_programme
			AND  programme.id_programme = '".addslashes($_POST['id'])."'
		") or die('erreur1');
	echo 2;

	}

?>

