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
    /* Seletionner tous les produits vendus par categorie pour le jour précedent*/
	if($_POST['method']=="getproductbycategorybyday"){
		$result = mysqli_query(
						$con,
						"SELECT
                            COUNT(ligneachatsventes.id) as nb,
                            ligneachatsventes.total_vente as total_vente,
							ligneachatsventes.quantite as quantite_vente,
							produits.quantite as quantite_stocke,
							produits.designation
						FROM ligneachatsventes, produits, categories, stations
						WHERE ligneachatsventes.date_vente = DATE_ADD(CURDATE(), INTERVAL -1 DAY)
						AND ligneachatsventes.id_produit = produits.id
                        AND produits.id_categorie = categories.id
						AND categories.designation = 'Lubrifiant'
						AND produits.id_station = '".$_POST['idstation']."'
						GROUP BY ligneachatsventes.id
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
    
    /* Seletionner tous les produits vendus par categorie pour le mois en cours*/
	if($_POST['method']=="getproductbycategorybymonth"){
		$result = mysqli_query(
						$con,
						"SELECT
                            COUNT(ligneachatsventes.id) as nb,
                           ligneachatsventes.total_vente as total_vente,
							ligneachatsventes.quantite as quantite_vente,
							produits.quantite as quantite_stocke,
							produits.designation
						FROM ligneachatsventes, produits, categories, stations
						WHERE MONTH(date_vente) = MONTH(CURRENT_DATE())
						AND YEAR(date_vente) = YEAR(CURRENT_DATE())
						AND ligneachatsventes.id_produit = produits.id
                        AND produits.id_categorie = categories.id
						AND categories.designation = 'Lubrifiant'
						AND produits.id_station = '".$_POST['idstation']."'
						GROUP BY ligneachatsventes.id
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
	if($_POST['method']=="getstockproductbycategorybyday"){
		$result = mysqli_query(
						$con,
						"SELECT produits.quantite FROM  produits, categories, stations
						WHERE  categories.designation = 'Lubrifiant'
						AND produits.id_categorie = categories.id
						AND produits.id_station = '".$_POST['idstation']."'
						GROUP BY produits.id
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