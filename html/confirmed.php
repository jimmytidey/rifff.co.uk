<?php session_start(); 

include("db_connect.php"); 

$email          = $_POST['email'];
$user_name      = $_POST['user_name'];
$password       = md5($_POST['password']); 
$query          = "SELECT * FROM users WHERE email = '$email'";

$result        = mysql_query($query);  
if (!empty($result)) { 
    $unique_email = mysql_fetch_array($result);
}

$query = "SELECT * FROM users WHERE user_name = '$user_name'"; 

$result = mysql_query($query); 
if (!empty($result)) { 
    $unique_user_name = mysql_fetch_array($result);
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
        
            <?
           
            if(empty($unique_email) && empty($unique_user_name)) { 
                echo "<p>Creating you a user - $user_name</p>";
                $query = "INSERT INTO users (email, user_name, password) VALUES('$email', '$user_name', '$password')"; 
                mysql_query($query); 
                $_SESSION['user_name'] = $user_name;
                
            	if (is_dir('composer/projects/'.$user_name)) {
            		echo "Something strange has happened - tell jimmytidey@gmail.com"; 
            	}

            	else {
            		//make the project folder
            		$folder_name = escapeshellarg($user_name); 
            		$output = shell_exec("cp -r composer/projects/tom composer/projects/$folder_name");
                    echo "$output";
                    echo "<a href='composer/index.php'>Get Composing!</a>";
            	}                
                
                
            }

            else if(!empty($unique_email) && empty($unique_user_name)) { 
                echo "<p>This email address is already in use</p>"; 
                echo  "<p><a href='../signup.php'>Try again.</a></p>";
            }   
    
            else if(empty($unique_email) && !empty($unique_user_name)) {
                echo "<p>This username is already in use</p>";
                echo  "<p><a href='../signup.php'>Try again.</a></p>";
            }  
                           
            else if(!empty($unique_email) && !empty($unique_user_name)) { 
                echo "<p>This username and email are both in use</p>"; 
                echo  "<p><a href='../signup.php'>Try again.</a></p>";
            }        
        
            ?>
        
        </div>
        
        
    </body>
</html>