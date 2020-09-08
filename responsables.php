 <?php

 	/*
	* Projet : FEUILLE DE ROUTE MINESUP
	* Code PHP : responsable.php (responsable page)
	************************************************
	* Auteur : Valentin Magde,Demasso James,Nebo Djomche Joress
	* E-mails : <valentinmagde@gmail.com>
	*/

 	/*---Pour permettre à un site de faire des demandes CORS sans utiliser le caractère générique "*" (par exemple, pour activer les informations d'identification), votre serveur doit lire la valeur de l'en-tête Origin de la demande et utiliser cette valeur pour définir Access-Control-Allow-Origin. doit également définir un en-tête Vary: Origin pour indiquer que certains en-têtes sont définis de manière dynamique en fonction de l'origine. ---*/
	header("Access-Control-Allow-Origin: *");
	header("Content-Type: application/json; charset=UTF-8");
	include('config/c.php');
	include('include/functions.php');

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

	/*--- Modification d'un Utilisateur---*/
	if ($_POST['method']=="modif") {
		mysqli_query($con,"UPDATE utilisateur SET 
				nom_utilisateur = '".addslashes($_POST['nom'])."',
				mail_utilisateur = '".addslashes($_POST['email'])."',
				tel_utilisateur = '".addslashes($_POST['telephone'])."',
				id_structure = '".addslashes($_POST['structure'])."',
				id_role = '".addslashes($_POST['role'])."'
				WHERE id_utilisateur = '".addslashes($_POST['id'])."'
			") or die('erreur1');
		echo 1;
	}

	/*--- Création d'un Utilisateur---*/
	elseif($_POST['method']=="creer"){	
		$errors=[];

		if(!filter_var(addslashes($_POST['email']), FILTER_VALIDATE_EMAIL)){
			$errors[] = "Adresse email invalide";
		}
		if(mb_strlen(addslashes($_POST['password'])) < 6){
				$errors[] = "Mot de passe trop court! (Minimum 6 caracteres)";
		} else{
			if(addslashes($_POST['password']) != addslashes($_POST['confirm'])){
				$errors[]="Les deux mots de passe ne concordent pas!";
			}
		}


		if(is_already_in_use('mail_utilisateur', addslashes($_POST['email']), 'utilisateur')){
			$errors[] = "Adresse Email déjà utilisée!";
		}
		if(count($errors)==0){
			$mail = new PHPmailer();
			//Server settings                     // Enable verbose debug output
	        $mail->isSMTP();                                            // Send using SMTP
	        $mail->Host       = 'smtp.gmail.com';                    // Set the SMTP server to send through
	        $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
	        $mail->Username   = 'valentinmagde@gmail.com';                     // SMTP username
	        $mail->Password   = 'phpuserMAC45';                               // SMTP password
	        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` encouraged
	        $mail->Port       = 587;  

			$mail->setFrom('valentinmagde@gmail.com', 'Feuille De Route'); //Personnaliser l'envoyeur
			$mail->addAddress(addslashes($_POST['email']), addslashes($_POST['nomPrenom'])); //Ajouter le destinataire
			/*$mail->addAddress('To2@example.com'); 
			$mail->addReplyTo('info@example.com', 'Information');*/ //L'adresse de réponse
			/*$mail->addCC('cc@example.com');
			$mail->addBCC('bcc@example.com');*/

			/*$mail->addAttachment('/var/tmp/file.tar.gz');*/ //Ajouter un attachement
			/*$mail->addAttachment('/tmp/image.jpg', 'new.jpg');*/ 
			/*$mail->isHTML(true);*/ // Paramétrer le format des emails en HTML ou non

			$mail->Subject = 'Creation d\'un compte sur Feuille de route';
			$mail->Body = "<b>Salut ".addslashes($_POST['nomPrenom']).",</b><br> 
						   Vous etes desormais membre de la plateforme Feuille de route du Ministere de l'enseigment superieur.<br>
						   Vos informations :<br>
						   <b>Pseudo:</b> ".addslashes($_POST['email'])."<br>
						   <b>Mot de passe:</b> ".addslashes($_POST['password'])."";
			$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
			
			if($mail->send()) {
				mysqli_query($con,"INSERT INTO utilisateur SET 
					nom_utilisateur = '".addslashes($_POST['nomPrenom'])."',
					tel_utilisateur = '".addslashes($_POST['telephone'])."',
					mail_utilisateur = '".addslashes($_POST['email'])."',
					id_role = '".addslashes($_POST['poste'])."',
					id_structure = '".addslashes($_POST['structure'])."',
					sexe = '".addslashes($_POST['sexe'])."',
					pass_utilisateur = '".addslashes(bcrypt_hash_password($_POST['password']))."'
				") or die('erreur1');
				echo 2;
			} 
		}else{
			echo json_encode($errors);
		}

	}

	/*--- Récupération du dernier Utilisateur ---*/
	elseif($_POST['method']=="dernier"){
		$result = mysqli_query($con,"SELECT * FROM utilisateur WHERE id_utilisateur IN (SELECT MAX(id_utilisateur) FROM utilisateur)") or die('erreur1');	

			while($row = mysqli_fetch_array($result))
			{
			    $rows[] = $row;
			}
		   //Return result to jTable
			$jTableResult = array();
			$jTableResult = $rows;
			print json_encode($jTableResult);

	}

	/*--- Suppresion d'un Utilisateur ---*/
	elseif($_POST['method']=="suppr") {
	mysqli_query($con,"DELETE FROM utilisateur WHERE id_utilisateur = '".$_POST['id']."'") or die('erreur1');
	echo 3;
	}else{
		$result = mysqli_query($con,"SELECT * FROM utilisateur ORDER BY id_utilisateur DESC") or die('erreur1');	

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