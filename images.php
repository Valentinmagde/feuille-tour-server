<?php
	
	/*
    * Projet : FEUILLE DE ROUTE MINESUP
    * Code PHP : images.php (images page)
    ************************************************
    * Auteur : Valentin Magde,Demasso James,Nebo Djomche Joress
    * E-mails : <valentinmagde@gmail.com>
  */

	/*---Pour permettre à un site de faire des demandes CORS sans utiliser le caractère générique "*" (par exemple, pour activer les informations d'identification), votre serveur doit lire la valeur de l'en-tête Origin de la demande et utiliser cette valeur pour définir Access-Control-Allow-Origin. doit également définir un en-tête Vary: Origin pour indiquer que certains en-têtes sont définis de manière dynamique en fonction de l'origine. ---*/
	header("Access-Control-Allow-Origin: *");
	header("Content-Type: application/json; charset=UTF-8");

	//Inclusion des fichiers externes
	//Inclusion du fichier de la connexion à la base de données
	include('../config/c.php');

	$result = mysqli_query($con,"SELECT * FROM structure") or die('erreur1');	

		while($row = mysqli_fetch_array($result))
		{
		    $rows[] = $row;
		}
	   //Return result to jTable
		$jTableResult = array();
		$jTableResult = $rows;
		print json_encode($jTableResult);

?>