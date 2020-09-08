<?php
	/*
	* Projet : FEUILLE DE ROUTE MINESUP
	* Code PHP : c.php (Page de connexion à la BD)
	************************************************
	* Auteur : Valentin Magde,Demasso James,Nebo Djomche Joress
	* E-mails : <valentinmagde@gmail.com>
	*/
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
$con=mysqli_connect('localhost','root','','tour','3306') or die("Database Error");
mysqli_query($con,"SET NAMES 'utf8'");
?>
