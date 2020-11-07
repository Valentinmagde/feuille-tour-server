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

	// Selection des tous les lavages entre deux dates données
	if($_POST['method']=="filtrelavages"){
        $id = $_POST['idstation'];

		$result = mysqli_query(
                    $con,
                    "SELECT * FROM lavages
                    WHERE (date_lavage BETWEEN '".$_POST['datedebut']."' AND '".$_POST['datefin']."')
                    AND id_station = $id
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

	// Selection des toutes les vidanges entre deux dates données
	if($_POST['method']=="filtrevidanges"){
        $id = $_POST['idstation'];

		$result = mysqli_query(
                    $con,
                    "SELECT * FROM vidanges
                    WHERE (date_vidange BETWEEN '".$_POST['datedebut']."' AND '".$_POST['datefin']."')
                    AND id_station = $id
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

	// Selection des tous les lavages de l'années en cours
	if($_POST['method']=="filtrelavagesanneecourante"){
        $id = $_POST['idstation'];

		$result = mysqli_query(
                    $con,
                    "SELECT * FROM lavages
					WHERE YEAR(date_lavage) = '".$_POST['anneecourante']."'
					AND id_station = $id
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

	// Selection des toutes les vidanges de l'années en cours
	if($_POST['method']=="filtrevidangesanneecourante"){
        $id = $_POST['idstation'];

		$result = mysqli_query(
                    $con,
                    "SELECT * FROM vidanges
					WHERE YEAR(date_vidange) = '".$_POST['anneecourante']."'
					AND id_station = $id
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

	/* Seletionner tous les pompes qui ont mise à jour aujourd'hui */
	if($_POST['method']=="getupdatepompesuperviseur"){
		$result = mysqli_query(
						$con,
						"SELECT 
							pompes.index_debut,
							pompes.index_fin,
							pompes.produit,
							stations.id,
							stations.nom
						FROM pompes, citernes, stations
						WHERE pompes.date_mise_a_jour = CURDATE()
						AND pompes.id_citerne = citernes.id
						AND citernes.id_station = stations.id
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

	/* Seletionner tous les lavages qui ont mise à jour aujourd'hui */
	if($_POST['method']=="getcurrentlavagesuperviseur"){
		$result = mysqli_query(
						$con,
						"SELECT
							COUNT(lavages.id) as nb,
							lavages.id_station,
							stations.nom
						FROM lavages, stations
						WHERE lavages.date_lavage = CURDATE()
						AND lavages.id_station = stations.id
						GROUP BY lavages.id_station
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

	/* Seletionner toutes les vidanges qui ont mise à jour aujourd'hui */
	if($_POST['method']=="getcurrentvidangesuperviseur"){
		$result = mysqli_query(
						$con,
						"SELECT
							COUNT(vidanges.id) as nb,
							vidanges.filtre,
							stations.id,
							stations.nom
						FROM vidanges, stations
						WHERE vidanges.date_vidange = CURDATE()
						AND vidanges.id_station = stations.id
						GROUP BY vidanges.id_station, vidanges.filtre
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

