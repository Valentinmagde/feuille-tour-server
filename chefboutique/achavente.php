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
	// Selection des toutes les pompes d'une station en base
	if($_POST['method']=="selectproduit"){
		$result = mysqli_query($con,
			"SELECT 
				produits.id,
				produits.designation,
				produits.quantite,
				produits.prix,
				produits.id_station,
				produits.id_categorie,
			FROM produits, citernes 
			WHERE produits.id_station =id
			") or die(mysqli_error($con));	

			while($row = mysqli_fetch_array($result))
			{
			    $rows[] = $row;
			}
		   //Return result to jTable
			$jTableResult = array();
			$jTableResult = $rows;
			print json_encode($jTableResult);
    }elseif($_POST['method']=="creer"){	
		mysqli_query($con,"INSERT INTO ligneachatsventes SET 
				
				quantite = '".addslashes($_POST['quantite'])."',
				total = '".addslashes($_POST['total'])."',
				date_achat = '".addslashes($_POST['date_achat'])."',
				id_produit = '".$_POST['id_categorie']."',
			") or die(mysqli_error($con));
		echo 2;
	
		// Selection de la dernière action en base
		// Contrainte {id}
		}
?>

