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
	include('config/c.php');
	
	//Année en cours
	$currentYear = date("Y");

	// Modification des données d'un programme
	// Contrainte {id}
	if ($_POST['method']=="modif") {
		mysqli_query($con,"UPDATE programme SET 
				code_programme = '".addslashes($_POST['code'])."',
				denomination_programme = '".addslashes($_POST['intitule'])."',
				descriptif_programme = '".addslashes($_POST['description'])."',
				id_responsable = '".addslashes($_POST['responsable'])."'
				WHERE id_programme = '".addslashes($_POST['id'])."'
			") or die('erreur1');
		echo 1;

	}
	elseif($_POST['method']=="creer"){	

	// Création d'un programme
	// Données requises {code, denommination, descriptif, année, responsable}	
		mysqli_query($con,"INSERT INTO programme SET 
				code_programme = '".addslashes($_POST['noProgramme'])."',
				denomination_programme = '".addslashes($_POST['intituleProgramme'])."',
				descriptif_programme = '".addslashes($_POST['descriptionProgramme'])."',
				annee_programme = '".addslashes($_POST['anneeProgramme'])."',
				id_responsable = '".addslashes($_POST['responsable'])."'
			") or die('erreur1');
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
	mysqli_query($con,"DELETE FROM programme WHERE id_programme = '".$_POST['id']."'") or die('erreur1');
	echo 3;
	}

	//Selection des programmes validés
	elseif($_POST['method']=="listeProgrammeValider"){
		$result = mysqli_query($con,"SELECT * FROM programme WHERE valide_programme = 1 ORDER BY id_programme ASC") or die('erreur1');	

		while($row = mysqli_fetch_array($result))
		{
		    $rows[] = $row;
		}
	   //Return result to jTable
		$jTableResult = array();
		$jTableResult = $rows;
		print json_encode($jTableResult);

	}
	//Valider un programme
	elseif($_POST['method']=="validerProgramme"){
		mysqli_query($con,"UPDATE programme SET valide_programme = 1 WHERE annee_programme = '".$currentYear."' ") or die('erreur1');
			echo 5;
	}

	// Selection des toutes les données en base
	else{
		$result = mysqli_query($con,"SELECT * FROM programme WHERE valide_programme = 0 ORDER BY id_programme ASC") or die('erreur2');	

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

