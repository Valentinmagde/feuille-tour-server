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
    }
		/* Enregistrer une vente */
		elseif($_POST['method']=="enregistrervente"){
			$ventes = json_decode(stripslashes($_POST['vente']));
			$nbre_article = sizeof($ventes);

			mysqli_query($con,"INSERT INTO achatsventes SET 
					total_vente = '".addslashes($_POST['total'])."',
					nom_client = '".addslashes($_POST['client'])."',
					nombre_article = $nbre_article,
					type_commande = '".addslashes($_POST['typecmd'])."'
				") or die(mysqli_error($con));

			$id_achatvente = mysqli_insert_id($con);

			mysqli_query($con,"INSERT INTO factures SET 
				total_vente = '".addslashes($_POST['total'])."',
				id_achatvente = $id_achatvente
			") or die(mysqli_error($con));

			$id_facture = mysqli_insert_id($con);
			mysqli_query($con,"INSERT INTO lignesfactures SET 
				total_vente = '".addslashes($_POST['total'])."',
				quantite = $nbre_article,
				id_facture = $id_facture
			") or die(mysqli_error($con));

			foreach ($ventes as $key => $vente) {
				mysqli_query($con,"INSERT INTO ligneachatsventes SET 
					quantite = $vente->quantite,
					total_vente = $vente->total,
					id_produit = $vente->id,
					id_commande = $id_achatvente
				") or die(mysqli_error($con));

				mysqli_query($con,
					"UPDATE produits SET 
						quantite = quantite - $vente->quantite
					WHERE id = $vente->id
				") or die(mysqli_error($con));

				mysqli_query($con,
				"UPDATE stockes SET 
					quantite_stocke = quantite_stocke - $vente->quantite
				WHERE id_produit = $vente->id
				") or die(mysqli_error($con));
			}
			echo 2;
		}

		/* Ajouter un stocke*/
		elseif($_POST['method']=="ajoutstocke"){
			$quantite = $_POST['quantite'];
			mysqli_query($con,
					"UPDATE produits SET 
						quantite = quantite + $quantite
					WHERE id = '".$_POST['id']."'
				") or die(mysqli_error($con));

				mysqli_query($con,
				"UPDATE stockes SET 
					quantite_stocke = quantite_stocke + $quantite
				WHERE id_produit = '".$_POST['id']."'
				") or die(mysqli_error($con));
			echo 1;
		}
?>

