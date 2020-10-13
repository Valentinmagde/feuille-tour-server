<?php

	/*
    * Projet : FEUILLE DE ROUTE MINESUP
    * Code PHP : mail.php (mail page)
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

	// Création d'une notification
	// Données requises {sujet, contenu, indentifiant emetteur, indentifiant recepteur}
	if ($_POST['method']=="creer") {
		mysqli_query($con,"INSERT INTO notifications SET 
			sujet_notif = '".addslashes($_POST['sujet'])."',
			contenu_notif = '".addslashes($_POST['contenu'])."',
			id_emetteur = '".addslashes($_POST['id_emetteur'])."',
			id_recepteur = '".addslashes($_POST['id_recepteur'])."'
		") or die(mysqli_error($con));
		
		echo 1;
	}

	// Modification des données d'une notification
	// Contrainte {id}
	else if ($_POST['method']=="modif") {
	mysqli_query($con,"UPDATE notifications SET
			lecture_notif = '".addslashes($_POST['valeur'])."'
			WHERE id_notif = '".addslashes($_POST['id'])."'
		") or die(mysqli_error($con));
	echo 1;
	}

	// Modification des données d'une notification
	// Changer le statut d'une notification en base
	// Contrainte {id}
	// Valeur {1,2,3,4}
	else if ($_POST['method']=="changer") {
		mysqli_query($con,"UPDATE notifications SET
				status_notif = '".addslashes($_POST['valeur'])."'
				WHERE id_notif = '".addslashes($_POST['id'])."'
			") or die(mysqli_error($con));
		echo 1;
	}
	else{
		$result = mysqli_query($con,"SELECT * FROM notifications ORDER BY id_notif DESC") or die(mysqli_error($con));	

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