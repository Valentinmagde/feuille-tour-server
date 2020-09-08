<?php

	/*
    * Projet : FEUILLE DE ROUTE MINESUP
    * Code PHP : activites.php (activites page)
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

	// Modification des données d'une activité
	// Contrainte {id}
	if ($_POST['method']=="modif") {
	mysqli_query($con,"UPDATE activite SET 
			code_activite = '".addslashes($_POST['code'])."',
			denomination_activite = '".addslashes($_POST['intitule'])."',
			resultatj_activite = '".addslashes($_POST['description'])."',
			resultatd_activite = '".addslashes($_POST['indicateur'])."',
			id_action = '".$_POST['action']."'
			WHERE id_activite = '".$_POST['id']."'
		") or die('erreur1');
	echo 1;

	// Création d'une activité
	// Données requises {code, denomination, indicateur, programme}
	}elseif($_POST['method']=="creer"){	
	mysqli_query($con,"INSERT INTO activite SET 
			code_activite = '".addslashes($_POST['code_activite'])."',
			denomination_activite = '".addslashes($_POST['denomination'])."',
			resultatj_activite = '".addslashes($_POST['resultatj_activite'])."',
			resultatd_activite = '".addslashes($_POST['resultatd_activite'])."',
			id_action = '".$_POST['denomination_action']."'
		") or die('erreur1');
	echo 2;

	// Selection de la dernière activité en base
	// Contrainte {id}
	}elseif($_POST['method']=="dernier"){
		$result = mysqli_query($con,"SELECT * FROM activite WHERE id_activite IN (SELECT MAX(id_activite) FROM activite)") or die('erreur1');	

			while($row = mysqli_fetch_array($result))
			{
			    $rows[] = $row;
			}
		   //Return result to jTable
			$jTableResult = array();
			$jTableResult = $rows;
			print json_encode($jTableResult);

	// Suppression d'une action en base
	}elseif($_POST['method']=="suppr") {
		mysqli_query($con,"DELETE FROM activite WHERE id_activite = '".$_POST['id']."'") or die('erreur1');
		echo 3;

	// Assigner un responsable à une activité
	}elseif($_POST['method']=="assigner") {
		mysqli_query($con,"UPDATE activite SET 
			id_responsable = '".addslashes($_POST['responsable'])."'
			WHERE id_activite = '".$_POST['activite']."'
		") or die('erreur1');
		echo 1;
	}

	// Selection des toutes les données en base
	else{
		$result = mysqli_query($con,"SELECT * FROM activite WHERE archive = 0 ORDER BY id_activite DESC") or die('erreur1');	

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

