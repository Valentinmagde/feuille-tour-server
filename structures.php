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
	include('config/c.php');
	
	// Modification des données d'une structure
	// Contrainte {id}
	if ($_POST['method']=="modif") {
		$code = addslashes($_POST['code']);
		$intitule = addslashes($_POST['intitule']);
		$descriptif = addslashes($_POST['descriptif']);
		$id = $_POST['id'];
		mysqli_query($con,"UPDATE structure SET
				code_structure = '".$code."',
				intitule_structure = '".$intitule."',
				descriptif_structure = '".$descriptif."'
				WHERE id_structure = '".$id."'
			") or die('erreur1');
		echo 1;
	}

	// Création d'une structure
	// Données requises {code, intitulé, descriptif}
	elseif($_POST['method']=="creer"){	
		mysqli_query($con,"INSERT INTO structure SET 
				code_structure = '".addslashes($_POST['code'])."',
				intitule_structure = '".addslashes($_POST['intitule'])."',
				descriptif_structure = '".addslashes($_POST['descriptif'])."'
			") or die('erreur1');
		echo 2;
	}
	// Selection de la dernière structure en base
	// Contrainte {id}
	elseif($_POST['method']=="dernier"){
		$result = mysqli_query($con,"SELECT * FROM structure WHERE id_structure IN (SELECT MAX(id_structure) FROM structure)") or die('erreur1');	

			while($row = mysqli_fetch_array($result))
			{
			    $rows[] = $row;
			}
		   //Return result to jTable
			$jTableResult = array();
			$jTableResult = $rows;
			print json_encode($jTableResult);
	}
	// Suppression d'une structure en base
	elseif($_POST['method']=="suppr") {
	mysqli_query($con,"DELETE FROM structure WHERE id_structure = '".$_POST['id']."'") or die('erreur1');
	echo 3;
	}

	// Selection des toutes les données en base
	else{
		$result = mysqli_query($con,"SELECT * FROM structure ORDER BY id_structure DESC") or die('erreur1');	

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