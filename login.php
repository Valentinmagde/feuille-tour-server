<?php
    
  /*
    * Projet : FEUILLE DE ROUTE MINESUP
    * Code PHP : login.php (login page)
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
   include('include/functions.php');
   session_start();

   use PHPMailer\PHPMailer\PHPMailer;
   use PHPMailer\PHPMailer\Exception;

   /* Exception class. */
   require 'PHPMaile/src/Exception.php';

   /* The main PHPMailer class. */
   require 'PHPMaile/src/PHPMailer.php';

   /* SMTP class, needed if you want to use SMTP. */
   require 'PHPMaile/src/SMTP.php';
   require 'mailer/vendor/autoload.php'; 

   $email = new PHPMailer(TRUE);
   
   // Connexion
   // Contrainte {email, mot de passe}
   if($_POST['method']=="login") {

      // username and password sent from form
      $myusername = mysqli_real_escape_string($con,$_POST['username']);
      $mypassword = mysqli_real_escape_string($con,$_POST['password']); 

      //Selection des données en base de l'utilisateur
      //Donées (identifiant et role)
      $sql = "SELECT id_utilisateur, id_role, pass_utilisateur FROM utilisateurs WHERE mail_utilisateur = '$myusername'";

      // Execution de la requette
      $result = mysqli_query($con,$sql);

      $row = mysqli_fetch_array($result,MYSQLI_ASSOC);

      $arr = [];
      
      $count = mysqli_num_rows($result);
      /*$user = $result->fetch(PDO::FETCH_OBJ);*/
      // If result matched $myusername and $mypassword, table row must be 1 row
      if($count == 1) {

         if(password_verify($mypassword, $row['pass_utilisateur'])){
          $_SESSION['login_user'] = $myusername;

          $arr[] = [1,$row['id_role'],$row['id_utilisateur'], $_POST['password']];
          echo json_encode($arr);
         }
         else {
          $arr[] = [0];
  
          echo json_encode($arr);
          $error = "Votre pseudo ou mot de passe est incorrect";
        }
      }
      else {
        $arr[] = [0];

        echo json_encode($arr);
        $error = "Compte inexistant";
      }
   }

   //Restauration du mot de passe
   else if ($_POST['method']=="forget") {
      // Chaîne de tous les caractères alphanumériques 
      $str_result = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

      // Shufle the $str_result and returns substring 
      // of specified length 
      $password = substr(str_shuffle($str_result),0, 8); 

      $myusername = mysqli_real_escape_string($con,$_POST['restore']);
      $result = "SELECT pass_utilisateur,nom_utilisateur FROM utilisateur WHERE mail_utilisateur = '$myusername'";  

      $results = mysqli_query($con,$result);
      $row = mysqli_fetch_array($results,MYSQLI_ASSOC);

      $count = mysqli_num_rows($results);
      if($count > 0) {
        $mail = new PHPmailer();
        //Server settings                     // Enable verbose debug output
        $mail->isSMTP();                                            // Send using SMTP
        $mail->Host       = 'smtp.gmail.com';                    // Set the SMTP server to send through
        $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
        $mail->Username   = 'moudinearmel@gmail.com';                     // SMTP username
        $mail->Password   = 'Bacd2013@@@@';                               // SMTP password
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` encouraged
        $mail->Port       = 587;           
      
        $mail->setFrom('moudinearmel@gmail.com', 'Feuille De Route'); //Personnaliser l'envoyeur
        $mail->addAddress(addslashes($myusername), addslashes($row['nom_utilisateur'])); 
        $mail->Subject = 'Restoration du mot de passe';
        $mail->Body = "<b>Salut ".addslashes($row['nom_utilisateur']).",</b><br> 
               Votre mot de passe à été restoré avec succès.<br>
               Vos informations :<br>
               <b>Pseudo:</b> ".addslashes($myusername)."<br>
               <b>Mot de passe:</b> ".addslashes($password)."";
        $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
      
        if($mail->send()) {
          mysqli_query($con,"UPDATE utilisateur SET 
            pass_utilisateur = '".bcrypt_hash_password($password)."'
            WHERE mail_utilisateur = '".$myusername."'
          ") or die('erreur1');
          echo 1;
        }else{
          echo 2;
        } 
      }else {
        echo 3;
      }
      /*echo $row['pass_utilisateur'];*/
     }
?>