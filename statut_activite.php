<?php

	/*
	* Projet : FEUILLE DE ROUTE MINESUP
	* Code PHP : statut_activite.php (login page)
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

	// Changer le statut d'une activité en fait
	if ($_POST['method']=="check") {
		$valeur = addslashes($_POST['valeur']);
		$id = $_POST['id'];
		$mois = $_POST['mois'];
		if ($mois == 1) {
			mysqli_query($con,"UPDATE activite SET
				statutj_activite = '".$valeur."',
				mois_realisation = '".date('m')."'
				WHERE id_activite = '".$id."'
			") or die('erreur1');
		}else{
			mysqli_query($con,"UPDATE activite SET
				statutd_activite = '".$valeur."'
				WHERE id_activite = '".$id."'
			") or die('erreur1');
		}
		
		echo 1;
	}
	// Changer le statut d'une activité en encour
	elseif($_POST['method']=="warning"){	
		$valeur = addslashes($_POST['valeur']);
		$pourcentage1 = addslashes($_POST['pourcentage1']);
		$pourcentage2 = addslashes($_POST['pourcentage2']);
		$id = $_POST['id'];
		$mois = $_POST['mois'];
		if ($mois == 1) {
			mysqli_query($con,"UPDATE activite SET
				statutj_activite = '".$valeur."',
				evolutionj_activite = '".$pourcentage1."',
				mois_realisation = '".date('m')."'
				WHERE id_activite = '".$id."'
			") or die('erreur1');
		}else{
			mysqli_query($con,"UPDATE activite SET
				statutd_activite = '".$valeur."',
				evolutiond_activite = '".$pourcentage2."',
				mois_realisation = '".date('m')."'
				WHERE id_activite = '".$id."'
			") or die('erreur1');
		}
		
		echo 2;
	}

	// Changer le statut d'une activité en pas encore fait
	elseif($_POST['method']=="danger"){	
		$valeur = addslashes($_POST['valeur']);
		$id = $_POST['id'];
		$mois = $_POST['mois'];
		if ($mois == 1) {
			mysqli_query($con,"UPDATE activite SET
				statutj_activite = '".$valeur."'
				WHERE id_activite = '".$id."'
			") or die('erreur1');
		}else{
			mysqli_query($con,"UPDATE activite SET
				statutd_activite = '".$valeur."'
				WHERE id_activite = '".$id."'
			") or die('erreur1');
		}
		echo 2;
	}

	// Commenter une activité
	elseif($_POST['method']=="comment"){	
		$valeur1 = addslashes($_POST['valeur1']);
		$valeur2 = addslashes($_POST['valeur2']);
		$id = $_POST['id'];
		$mois = $_POST['mois'];
		if ($mois == 1) {
			mysqli_query($con,"UPDATE activite SET
				commentairej_activite = '".$valeur1."'
				WHERE id_activite = '".$id."'
			") or die('erreur1');
		}else{
			mysqli_query($con,"UPDATE activite SET
				commentaired_activite = '".$valeur2."'
				WHERE id_activite = '".$id."'
			") or die('erreur1');
		}
		echo 2;
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