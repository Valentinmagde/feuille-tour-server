<?php

	/*
	* Projet : FEUILLE DE ROUTE MINESUP
	* Code PHP : structure.php (structure page)
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
	
	// Modification des données d'une villes
	// Contrainte {id}
	if ($_POST['method']=="modif") {
		$code = addslashes($_POST['code']);
		$nom = addslashes($_POST['nom']);
		$descriptif = addslashes($_POST['descriptif']);
		$id = $_POST['id'];
		mysqli_query($con,"UPDATE villes SET
				code = '".$code."',
				nom = '".$nom."',
				descriptif = '".$descriptif."'
				WHERE id = '".$id."'
			") or die(mysqli_error($con));
		echo 1;
	}

	// Création d'une ville
	// Données requises {code, nom, descriptif}
	elseif($_POST['method']=="creer"){	
		mysqli_query($con,"INSERT INTO villes SET
				nom = '".addslashes($_POST['nom'])."', 
				code = '".addslashes($_POST['code'])."',
				descriptif = '".addslashes($_POST['descriptif'])."'
			") or die(mysqli_error($con));
		echo 2;
	}
	// Selection de la dernière ville en base
	// Contrainte {id}
	elseif($_POST['method']=="dernier"){
		$result = mysqli_query($con,"SELECT * FROM villes WHERE id IN (SELECT MAX(id) FROM villes)") or die('erreur1');	

			while($row = mysqli_fetch_array($result))
			{
			    $rows[] = $row;
			}
		   //Return result to jTable
			$jTableResult = array();
			$jTableResult = $rows;
			print json_encode($jTableResult);
	}
	// Suppression d'une ville en base
	elseif($_POST['method']=="suppr") {
	mysqli_query($con,"DELETE FROM villes WHERE id = '".$_POST['id']."'") or die('erreur1');
	echo 3;
	}

	// Selection des toutes les données en base
	else{
		$result = mysqli_query($con,"SELECT * FROM villes ORDER BY id DESC") or die('erreur1');	

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