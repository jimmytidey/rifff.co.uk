<?php 

session_start();
include("db_connect.php"); 

if (isset($_POST['email'])) {
    $email = $_POST['email'];
    $password = md5($_POST['password']); 
    $query = "SELECT * FROM users WHERE email = '$email' && password = '$password'"; 
      
    $sucess = mysql_fetch_array(mysql_query($query));
    
    if (is_array($sucess)) { 
        $_SESSION['user_name'] = $sucess['user_name']; 
        header('Location: composer/index.php');
    }
    else { 
        echo "<p>Your user name and password did not match</p>"; 
        echo "<p>If you've forgotten it - email jimmytidey@gmail.com, or try again below</p>"; 
    }
}

?>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8">
		<title>RIFFF</title>
		<link rel="stylesheet" href="css/main.css" type="text/css" media="screen" title="no title" >
		<link rel="icon" type="image/png"  href="favicon.ico">
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.5.min.js"></script>
		<script>
		
		</script> 
		
    </head>
    
    <body <body id="index">

		<div id='content'>
			<img src='resources/title.png' />
			    
    			<form method='POST' action='<?=$_SERVER['PHP_SELF'] ?>' id='auth' name='auth' >
    			    <label for='email'>Email</label><input type='text' id='email' name='email' />
    			    <label for='password'>Password</label><input type='password' id='password' name='password' />
			        <input type='submit' value = "log in &raquo;" id='login_submit' />
			    </form>
        </div>
        
        
    </body>
</html>