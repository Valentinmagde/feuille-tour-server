<?php

	/*
	* Projet : FEUILLE DE ROUTE MINESUP
	* Code PHP : programme.php (programme page)
	************************************************
	* Auteur : Valentin Magde,Demasso James,Nebo Djomche Joress
	* E-mails : <valentinmagde@gmail.com>
	*/

	/*---Pour permettre à un site de faire des demandes CORS sans utiliser le caractère générique "*" (par exemple, pour activer les informations d'identification), votre serveur doit lire la valeur de l'en-tête Origin de la demande et utiliser cette valeur pour définir Access-Control-Allow-Origin. doit également définir un en-tête Vary: Origin pour indiquer que certains en-têtes sont définis de manière dynamique en fonction de l'origine. ---*/
	header("Access-Control-Allow-Origin: *");
	header("Content-Type: application/json; charset=UTF-8");

	//Inclusion des fichiers externes
	//Inclusion du fichier de la connexion à la base de données
	include('../config/c.php');
	
	//Année en cours
	$currentYear = date("Y");

	// Modification des données d'un programme
	// Contrainte {id}
	if ($_POST['method']=="modif") {
		mysqli_query($con,"UPDATE stations SET 
				nom = '".addslashes($_POST['nom'])."',
				adresse = '".addslashes($_POST['adresse'])."',
				latitude = '".addslashes($_POST['latitude'])."',
				longitude = '".addslashes($_POST['longitude'])."',
				id_gerant = '".addslashes($_POST['gerant'])."',
				id_chef_boutique = '".addslashes($_POST['chefboutique'])."',
				id_chef_piste = '".addslashes($_POST['chefpiste'])."'
				WHERE id = '".addslashes($_POST['id'])."'
			") or die(mysqli_error($con));
		echo 1;

	}
	elseif($_POST['method']=="creer"){	

	// Création d'un programme
	// Données requises {code, denommination, descriptif, année, responsable}	
		mysqli_query($con,"INSERT INTO stations SET 
				nom = '".addslashes($_POST['nom'])."',
				adresse = '".addslashes($_POST['adresse'])."',
				latitude = '".addslashes($_POST['latitude'])."',
				longitude = '".addslashes($_POST['longitude'])."',
				mode_gestion = '".addslashes($_POST['modegestion'])."',
				horaire_ouverture = '".addslashes($_POST['horaireouverture'])."',
				nb_employes  = '".addslashes($_POST['nbemployes'])."',
				installation  = '".addslashes($_POST['installation'])."',
				baie_lavage  = '".addslashes($_POST['baielavage'])."',
				baie_service  = '".addslashes($_POST['baieservice'])."',
				type_volucompteur  = '".addslashes($_POST['typevolucompteur'])."',
				type_cuve  = '".addslashes($_POST['typecuve'])."',
				email  = '".addslashes($_POST['email'])."',
				positionnement  = '".addslashes($_POST['positionnement'])."',
				date_ouverture  = '".addslashes($_POST['dateouverture'])."',
				id_ville = '".addslashes($_POST['listevilles'])."',
				id_gerant = '".addslashes($_POST['listresponsables'])."',
				id_chef_piste = '".addslashes($_POST['listechefpiste'])."',
				id_chef_boutique = '".addslashes($_POST['listechefboutique'])."'
			") or die(mysqli_error($con));
		echo 2;

	}

	// Selection du dernier programme en base
	// Contrainte {id}
	elseif($_POST['method']=="dernier"){
		$result = mysqli_query($con,"SELECT * FROM programme WHERE id_programme IN (SELECT MAX(id_programme) FROM programme)") or die('erreur1');	

			while($row = mysqli_fetch_array($result))
			{
			    $rows[] = $row;
			}
		   //Return result to jTable
			$jTableResult = array();
			$jTableResult = $rows;
			print json_encode($jTableResult);

	}
	// Suppression d'un programme en base
	elseif($_POST['method']=="suppr") {
		mysqli_query($con,"DELETE FROM stations WHERE id = '".$_POST['id']."'") or die('erreur1');
		echo 3;
	}

	/********* afficher la station d'un utilisateur *********/
	elseif($_POST['method']=="get"){

		/* echo $_POST['foreign']; */

		$foreign_key = $_POST['foreign'];
		$user_id = $_POST['user_id'];

		$result = mysqli_query($con,"SELECT * FROM stations WHERE $foreign_key=$user_id") or die(mysqli_error($con));
		
		$rows = [];
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

