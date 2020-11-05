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
	mysqli_query($con,"UPDATE stocke_citerne SET 
			quantite_stocke = '".addslashes($_POST['quantite'])."',
			id_citerne = '".addslashes($_POST['citerne'])."'
			WHERE id = '".addslashes($_POST['id'])."'
		") or die(mysqli_error($con));
	echo 1;

	// Création d'une action
	// Données requises {code, denomination, indicateur, programme}
	}elseif($_POST['method']=="creer"){	
	mysqli_query($con,"INSERT INTO stocke_citerne SET 
			quantite_stocke = '".addslashes($_POST['quantite'])."',
			date_creation = '".addslashes($_POST['datecreation'])."',
			id_citerne = '".$_POST['citerne']."'
			ON DUPLICATE KEY UPDATE
			quantite_stocke = quantite_stocke + '".addslashes($_POST['quantite'])."'
		") or die(mysqli_error($con));
	echo 2;

	// Selection de la dernière action en base
	// Contrainte {id}
	}elseif($_POST['method']=="suppr") {
		mysqli_query($con,"DELETE FROM stocke_citerne WHERE id = '".$_POST['id']."'") or die(mysqli_error($con));
		echo 3;
	}

	// Selection des tous les citernes d'un chef de piste en base
	elseif($_POST['method']=="getciternes"){
		$result = mysqli_query(
                    $con,
                    "SELECT * FROM citernes
                    WHERE id_station = '".$_POST['idstation']."'
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
    // Selection des tous les stockes d'un chef de piste en base
	elseif($_POST['method']=="getstockes"){
		$result = mysqli_query(
                    $con,
                    "SELECT 
                        stocke_citerne.id,
                        stocke_citerne.quantite_stocke,
                        stocke_citerne.date_creation,
                        stocke_citerne.date_mise_a_jour,
                        stocke_citerne.id_citerne
                    FROM stocke_citerne, citernes
                    WHERE stocke_citerne.id_citerne = citernes.id
                    AND citernes.id_station = '".$_POST['idstation']."'
                    ") or die(mysqli_error($con));	

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

