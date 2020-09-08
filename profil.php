<?php

    /*
    * Projet : FEUILLE DE ROUTE MINESUP
    * Code PHP : profil.php (profil page)
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
   

    $uploadDir = 'uploads/'.$_POST['id']; 
    $response = array( 
        'status' => 0, 
        'message' => 'La soumission du formulaire a échoué. Veuillez réessayer.' 
    ); 
     
    // If form is submitted 
    if(isset($_POST['name']) || isset($_POST['email']) || isset($_POST['password']) || isset($_POST['confirm_password'])|| isset($_POST['sex'])|| isset($_POST['tel'])|| isset($_POST['file'])){ 
        // Get the submitted form data 
        $avatar = '';
        $name = $_POST['name']; 
        $email = $_POST['email']; 
        $tel = $_POST['tel']; 
        $sexe = $_POST['sex']; 
        $password = $_POST['password']; 
        $confirm_password = $_POST['confirm_password']; 
         
        // Check whether submitted data is not empty 
        if(!empty($name) && !empty($email) && !empty($tel) && !empty($sexe)&& !empty($password)&& !empty($confirm_password)){ 
            // Validate email 
            if(filter_var($email, FILTER_VALIDATE_EMAIL) === false){ 
                $response['message'] = 'S\'il vous plaît entrer un mail valide.'; 
            }else{ 
                $uploadStatus = 1; 
                 
                // Upload file 
                $uploadedFile = ''; 
                if(!empty($_FILES["avatar"]["name"])){ 
                     
                    // File path config 
                    if(!file_exists($uploadDir)){
                      mkdir($uploadDir, 0755, true);
                    }

                    $fileName = basename($_FILES["avatar"]["name"]); 
                    $targetFilePath = $uploadDir . '/' . $fileName; 
                    $fileType = pathinfo($targetFilePath, PATHINFO_EXTENSION); 

                    $avatar = $targetFilePath;
                     
                    // Allow certain file formats 
                    $allowTypes = array('jpg','JPG','png','PNG','JPEG','jpeg'); 
                    if(in_array($fileType, $allowTypes)){ 
                        // Upload file to the server 
                        if(move_uploaded_file($_FILES["avatar"]["tmp_name"], $targetFilePath)){ 
                            $uploadedFile = $fileName; 
                        }else{ 
                            $uploadStatus = 0; 
                            $response['message'] = 'Désolé, une erreur s\'est produite lors de l\'envoi de votre fichier.'; 
                        } 
                    }else{ 
                        $uploadStatus = 0; 
                        $response['message'] = 'Désolé,seuls les fichiers JPG, JPEG et PNG sont autorisés à télécharger.'; 
                    } 
                } 
                 
                if($uploadStatus == 1){ 
                     
                    // Insert form data in the database
                    
                      $insert = $con->query("UPDATE utilisateur SET 
                      nom_utilisateur = '".addslashes($name)."',
                      mail_utilisateur = '".addslashes($email)."',
                      tel_utilisateur = '".addslashes($tel)."',
                      sexe = '".addslashes($sexe)."',
                      pass_utilisateur = '".addslashes(bcrypt_hash_password($password))."',
                      avatar = '".addslashes($avatar)."'
                      WHERE id_utilisateur = '".addslashes($_POST['id'])."'"); 
                    
                    if($insert){ 
                        $response['status'] = 1; 
                        $response['message'] = 'Modification effectuée avec succès!'; 
                    } 
                } 
            } 
        }else{ 
             $response['message'] = 'Veuillez remplir tous les champs obligatoires.'; 
        } 
    } 
     
    // Return response 
    echo json_encode($response);
?>