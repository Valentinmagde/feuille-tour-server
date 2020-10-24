<?php
	/*
    * Projet : FEUILLE DE TOUR
    * Code PHP : login.php (login page)
    ************************************************
    * Auteur : Moudine 
    * E-mails : <Moudinearmel@gmail.com>
  */
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
$con=mysqli_connect('localhost','root','','tour','3306') or die("Database Error");
mysqli_query($con,"SET NAMES 'utf8'");
?>
