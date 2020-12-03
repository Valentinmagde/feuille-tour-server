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
	mysqli_query($con,"UPDATE vidanges SET 
			imatricule_engin = '".addslashes($_POST['immatricule'])."',
			qualite_huile = '".addslashes($_POST['qualitehuile'])."',
			date_vidange = '".addslashes($_POST['datevidange'])."',
			filtre = '".addslashes($_POST['filtre'])."',
			id_station = '".addslashes($_POST['station'])."'
			WHERE id = '".addslashes($_POST['id'])."'
		") or die(mysqli_error($con));
	echo 1;

	// Création d'une action
	// Données requises {code, denomination, indicateur, programme}
	}elseif($_POST['method']=="creer"){	
	mysqli_query($con,"INSERT INTO vidanges SET 
			imatricule_engin = '".addslashes($_POST['immatricule'])."',
			qualite_huile = '".addslashes($_POST['qualitehuile'])."',
			filtre = '".addslashes($_POST['filtre'])."',
			date_vidange = '".addslashes($_POST['datevidange'])."',
			nom_client = '".addslashes($_POST['nomprenom'])."',
			telephone_client = '".addslashes($_POST['telephone'])."',
			marque_engin = '".addslashes($_POST['marqueengin'])."',
			type_filtre = '".addslashes($_POST['typefiltre'])."',
			id_station = '".$_POST['listestations']."'
		") or die(mysqli_error($con));
	echo 2;

	// Selection de la dernière action en base
	// Contrainte {id}
	}elseif($_POST['method']=="suppr") {
		mysqli_query($con,"DELETE FROM vidanges WHERE id = '".$_POST['id']."'") or die(mysqli_error($con));
		echo 3;
	}
	/* Rejeter une vidange */
	elseif($_POST['method']=="rejete") {
		mysqli_query($con,"UPDATE vidanges SET etat=2 WHERE id = '".$_POST['id']."'") or die(mysqli_error($con));
		echo 3;
	}

	/* valider une vidange */
	elseif($_POST['method']=="valide") {
		mysqli_query($con,"UPDATE vidanges SET etat=1 WHERE id = '".$_POST['id']."'") or die(mysqli_error($con));
		echo 3;
	}

	// Selection des toutes les vidanges d'un chef de piste en base
	elseif($_POST['method']=="getvidangegestionnaire"){
		$result = mysqli_query(
                    $con,
                    "SELECT * FROM vidanges
                    WHERE vidanges.id_station = '".$_POST['idstation']."'
                    ") or die(mysqli_error($con));	

			while($row = mysqli_fetch_array($result))
			{
			    $rows[] = $row;
			}
		   //Return result to jTable
			$jTableResult = array();
			$jTableResult = $rows;
			print json_encode($jTableResult);
	}
	// Selection des toutes les données en base
	else{
		$result = mysqli_query($con,"SELECT * FROM pompes") or die(mysqli_error($con));	

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

