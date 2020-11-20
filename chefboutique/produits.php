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
	mysqli_query($con,"UPDATE pompes SET 
			nom = '".addslashes($_POST['nom'])."',
			prix = '".addslashes($_POST['prix'])."',
			index_debut = '".addslashes($_POST['indexdebut'])."',
			index_fin = '".addslashes($_POST['indexfin'])."',
			type_volucompteur = '".addslashes($_POST['typevolucompteur'])."',
			id_station = '".addslashes($_POST['station'])."'
			WHERE id = '".addslashes($_POST['id'])."'
		") or die(mysqli_error($con));
	echo 1;

	// Création d'une action
	// Données requises {code, denomination, indicateur, programme}
	}
	elseif($_POST['method']=="creer"){	
		mysqli_query($con,"INSERT INTO produits SET 
            prix = '".addslashes($_POST['prix'])."',
			reference = '".addslashes($_POST['reference'])."',
			designation = '".addslashes($_POST['designation'])."',
			poids = '".addslashes($_POST['poids'])."',
			quantite = '".addslashes($_POST['quantite'])."',
			code = '".addslashes($_POST['code'])."',
			quantite_alert = '".addslashes($_POST['quantite_alert'])."',
			id_categorie = '".$_POST['id_categorie']."',
			id_station = '".$_POST['id_station']."'
		") or die(mysqli_error($con));

		$id_produit = mysqli_insert_id($con);

		mysqli_query($con,"INSERT INTO stockes SET 
			quantite_stocke = '".addslashes($_POST['quantite'])."',
			stocke_alerte = '".addslashes($_POST['quantite_alert'])."',
			id_produit = $id_produit
		") or die(mysqli_error($con));
	echo 2;

	// Selection de la dernière action en base
	// Contrainte {id}
	}elseif($_POST['method']=="dernier"){
		$result = mysqli_query($con,"SELECT * FROM action WHERE id_action IN (SELECT MAX(id_action) FROM action)") or die(mysqli_error($con));	

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
		mysqli_query($con,"DELETE FROM pompes WHERE id = '".$_POST['id']."'") or die(mysqli_error($con));
		echo 3;
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

