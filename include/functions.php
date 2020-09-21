<?php
	//Echapper les chaines de caratères
	if(!function_exists('e')){
		function e($string){
			if($string){
				return htmlspecialchars($string);
			}
		}
	}

	//Cell_count
	//Retourne le nombre d'enregistrement trouvés respectant
	//une certaine condition
	if(!function_exists('cell_count')){
		function cell_count($table, $field_name, $field_value){
			global $db;

			$req = $db->prepare("SELECT * FROM $table WHERE $field_name = ?");
			$req->execute([$field_value]);

			return $req->rowCount();
		}
	}
	//Remember me
	if(!function_exists('remember_me')){
		function remember_me($user_id){
			global $db;
			//Generer le token de manière aleatoire
			$token = openssl_random_pseudo_bytes(24);

			//Generer le selecteur de manière aleatoire
			// Que ce dernier est unique
			do{
				$selector = openssl_random_pseudo_bytes(9);
			}while (cell_count('auth_tokens', 'selector',$selector) > 0);

			// Sauver ces info (user_id, selector, expires(14 jours), token(hashed))
			// En base de donnée
			$req = $db->prepare('INSERT INTO auth_tokens(expires, selector, user_id, token)
								VALUES(DATE_ADD(NOW(), INTERVAL 14 DAY),:selector, :user_id, :token)');
			$req->execute([
				'selector' => $selector,
				'user_id' => $user_id,
				'token' => hash('sha256',$token)
			]);
			// Créer un Cookie 'auth' (14jrs expires) httpOnly => true
			// Contenu: base64_encode(selector).':'.base64_encode(token)
			setcookie(
				'auth',
				base64_encode($selector).':'.base64_encode($token),
				time()+1209600,
				null,
				null,
				false,
				true
		);
		}
	}
 
	//Auto login
	if(!function_exists('auto_login')){
		global $db;
		function auto_login(){
			//Verifier que notre cookie 'auth' existe
			if(!empty($_COOKIE['auth'])){
				$split = explode(':', $_COOKIE['auth']);

				if(count($plit) != 2){
					return false;
				}
				//Recupere via ce cookie selector, token
				list($selector,$token) = $split;

				$req = $db->prepare('SELECT auth_tokens.id, auth_tokens.token, auth_tokens.user_id 
									 users.id, users.pseudo, users.avatart, users.email
									 FROM auth_tokens 
									 LEFT JOIN users
									 ON auth_tokens.user_id = users.id
									 WHERE selector = ?' AND execute >= CURDATE());
				$req->execute([base64_decode($selector)]);

				$data = $req->fetch(PDO::FETCH_OBJ);
				if ($data) {
					if (hash_equal($data->token,hash('sha256',base64_decode($token)))) {
						session_regenerate_id(true);
						$_SESSION['user_id'] = $data->id;
						$_SESSION['pseudo'] = $data->pseudo;
						$_SESSION['avatar'] = $data->avatar;
						$_SESSION['email'] = $data->email;

						return true;
					}
				}
			}
			return false;
		}
	}

	//Redirection vers la page à la quelle l'utilisateur à cliquer
	if(!function_exists('redirect_intent_or')){
		function redirect_intent_or($default_url){
			if($_SESSION['forwarding_url']){
				$url = $_SESSION['forwarding_url'];
			}else{
				$url = $default_url;
			}
			$_SESSION['forwarding_url'] = null;
			redirect($url);
		}
	}


	//Get avatar URL
	if(!function_exists('get_avatar_url')){
		function get_avatar_url($email, $size = 25){
			return "http://gravatar.com/avatar/".md5(strtolower(trim(e($email))))."?s=".$size;
		}
	}

	//Check if an user is connected
	if(!function_exists('is_logged_in')){
		function is_logged_in(){
			return isset($_SESSION['user_id']) || isset($_SESSION['pseudo']);
		}
	}

	//Get session value by id
	if(!function_exists('get_session')){
		function get_session($key){
			if($key){
				return !empty($_SESSION[$key])
				?e($_SESSION[$key])
				:null;
			}
		}
	}

	//Hash password with Blowfish Algorithm
	if(!function_exists('bcrypt_hash_password')){
		function bcrypt_hash_password($value, $options = array()){
			$cost = isset($options['rounds']) ? $options['rounds']: 10;
			$hash = password_hash($value, PASSWORD_BCRYPT, array('cost' => $cost));
			if($hash === false){
				throw new Exception("Bcrypt hashing n'est pas supporté.");
			}
			return $hash;
		}
	}

	//Verify password
	if(!function_exists('bcrypt_verify_password')){
		function bcrypt_verify_password($value, $hashedValue){
			return password_verify($value, $hashedValue);
		}
	}


	//Get current locale
	if(!function_exists('get_current_locale')){
		function get_current_locale(){
			return $_SESSION['locale'];
		}
	}

	//Find an user by id
	if(!function_exists('find_user_by_id')){
		function find_user_by_id($id){
			 global $db;

			 $q = $db->prepare('SELECT name, pseudo, email, city, country, twitter, github, sex, available_for_hiring, bio, avatar FROM users WHERE id = ?');
			 $q->execute([$id]);
			 $data = $q->fetch(PDO::FETCH_OBJ);

			 $q->closeCursor();
			 return $data;
		}
	}

	//Find an code by id
	if(!function_exists('find_code_by_id')){
		function find_code_by_id($id){
			 global $db;

			$q = $db->prepare('SELECT code FROM codes WHERE id = ?');
			$q->execute([$id]);

			$data = $q->fetch(PDO::FETCH_OBJ);

			$q->closeCursor();
			return $data;
		}
	}

	if(!function_exists('not_empty')){
		function not_empty($fields=[]){
			if(count($fields)!=0){
				foreach ($fields as $field) {
					if(empty($_POST[$field]) || trim($_POST[$field])==""){
						return false;
					}
				}
				return true;
			}
		}
	}

	//Verification des données de l'utilisateur en base
	if(!function_exists('is_already_in_use')){
		function is_already_in_use($field, $value, $table){
			global $con;

			$q = mysqli_query($con,"SELECT id_utilisateur FROM $table WHERE $field = '".$value."'") or die(mysqli_error($con));

			$count = mysqli_fetch_array($q);

			return $count;
		}
	}

	//Mail de validation d'enregistrement
	if(!function_exists('set_flash()')){
		function set_flash($message, $type='info'){
			$_SESSION['notification']['message'] = $message;
			$_SESSION['notification']['type'] = $type;
		}
	}

	//Redirection vers une page precise
	if(!function_exists('redirect')){
		function redirect($page){
			header('Location:'.$page);
			exit();
		}
	}

	//Sauvegarder les données de l'utilisateur en session
	if(!function_exists('save_input_data')){
		function save_input_data(){
			foreach($_POST as $key=>$value){
				if(strpos($key, 'password') === false){
					$_SESSION['input'][$key] = $value;
				}
			}
		}
	}
	
	//Afficher les données de l'utilisateur dans les inputs
	if(!function_exists('get_input')){
		function get_input($key){
			return !empty($_SESSION['input'][$key])
				?e($_SESSION['input'][$key])
				:null;
		}
	}

	//Supprimer toutes les informations sauvegarder en session
	if(!function_exists('clear_input_data')){
		function clear_input_data(){
			if(isset($_SESSION['input'])){
				$_SESSION['input'] = [];
			}
		}
	}

	//Gère l'état actif de nos differents liens
	if(!function_exists('set_active')){
		function set_active($file, $class = 'active'){
			$page = array_pop(explode('/', $_SERVER['SCRIPT_NAME']));

			if($page == $file.'.php'){
				return $class;
			}else{
				return "";
			}
		}
	}