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
	mysqli_query($con,"UPDATE historiquepompes SET 
			date = '".addslashes($_POST['date'])."',
			index_initial = '".addslashes($_POST['indexdebut'])."',
			index_final = '".addslashes($_POST['indexfin'])."',
			retour_cuve = '".addslashes($_POST['retourcuve'])."',
			id_pompe = '".addslashes($_POST['pompe'])."'
			WHERE id = '".addslashes($_POST['id'])."'
		") or die(mysqli_error($con));
	echo 1;

	// Création d'une action
	// Données requises {code, denomination, indicateur, programme}
	}elseif($_POST['method']=="creer"){	
		$stocke_reel=$_POST['indexfin']-$_POST['indexdebut'];
		mysqli_query($con,"INSERT INTO historiquepompes SET 
			date= '".addslashes($_POST['date'])."',
			retour_cuve = '".addslashes($_POST['retourcuve'])."',
			index_initial = '".addslashes($_POST['indexdebut'])."',
			index_final = '".addslashes($_POST['indexfin'])."',
			id_pompe = '".$_POST['listespompes']."'
		") or die(mysqli_error($con));

		mysqli_query($con,
			"UPDATE stocke_citerne SET 
			quantite_stocke = quantite_stocke - $stocke_reel + '".addslashes($_POST['retourcuve'])."'
			WHERE id_citerne = '".addslashes($_POST['citerne'])."'
		") or die(mysqli_error($con));

		mysqli_query($con,
			"UPDATE citernes SET 
			quantite_stocke = quantite_stocke - $stocke_reel + '".addslashes($_POST['retourcuve'])."'
			WHERE id = '".addslashes($_POST['citerne'])."'
		") or die(mysqli_error($con));

		mysqli_query($con,
			"UPDATE pompes SET 
			index_debut = '".addslashes($_POST['indexdebut'])."',
			index_fin = '".addslashes($_POST['indexfin'])."'
			WHERE id = '".addslashes($_POST['listespompes'])."'
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
		mysqli_query($con,"DELETE FROM historiquepompes WHERE id = '".$_POST['id']."'") or die(mysqli_error($con));
		echo 3;
    }
    
	// Selection des toutes les pompes d'une station en base
	elseif($_POST['method']=="pompes"){
		$result = mysqli_query($con,
			"SELECT 
				pompes.id,
				pompes.nom,
				pompes.type_volucompteur,
				pompes.num_pompe,
				pompes.prix,
				pompes.index_debut,
				pompes.index_fin,
				pompes.id_citerne
			FROM pompes, citernes 
			WHERE pompes.id_citerne = citernes.id
			AND citernes.id_station = '".$_POST['id']."'
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
    
    // Selection des toutes les journaux d'un chef de piste en base
	elseif($_POST['method']=="getjournalchefpiste"){
		$result = mysqli_query(
                    $con,
                    "SELECT
                        historiquepompes.id,
                        historiquepompes.date, 
                        historiquepompes.index_initial, 
                        historiquepompes.index_final, 
                        historiquepompes.retour_cuve,
                        historiquepompes.etat,
                        historiquepompes.id_pompe
                    FROM historiquepompes, pompes, citernes
                    WHERE historiquepompes.etat != 1
                    AND historiquepompes.id_pompe = pompes.id
                    AND pompes.id_citerne = citernes.id
					AND citernes.id_station = '".$_POST['idstation']."'
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

?>

