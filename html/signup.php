<?php session_start(); ?>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8">
		<title>RIFFF</title>
		<link rel="stylesheet" href="css/main.css" type="text/css" media="screen" title="no title" >
		<link rel="icon" type="image/png"  href="favicon.ico">
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.5.min.js"></script>
		<script>
		    $(document).ready( function(){ 
		       
    		    $('#signup_submit').click(function(){
    		        var user_name = $('#user_name').val();  
    		        var email = $('#email').val(); 
    		        var email_confirm = $('#email_confirm').val(); 
    		        var password = $('#password').val(); 
    		        var password_confirm = $('#password_confirm').val(); 
		            
		            if (email=='' || email_confirm=='' || password=='' || password_confirm=='' || user_name == '') { 
		                $('#errors').html('All fields must be completed');
		            }
		            
		            else if (!looksLikeMail(email)){
		                $('#errors').html('Please use an email address that looks like a real one'); 		                
		            }
		            
    		        else if (email != email_confirm) { 
    		            $('#errors').html('Email addresses much match'); 
    		        }
		        
    		        else if  (password != password_confirm) { 
    		            $('#errors').html('Passwords much match'); 
    		        }
    		        
    		        else { 
    		            $('#errors').html(''); 
    		            document.auth.submit();
    		        }
    		    }); 
    		});
    		
    		
            function looksLikeMail(str) {
                var lastAtPos = str.lastIndexOf('@');
                var lastDotPos = str.lastIndexOf('.');
                return (lastAtPos < lastDotPos && lastAtPos > 0 && str.indexOf('@@') == -1 && lastDotPos > 2 && (str.length - lastDotPos) > 2);
            }
    		
	
		</script>
		
	</head>
	
	<body id="index">
		<div id='content'>
			<img src='resources/title.png' alt='title' />
			
			<p>This site has only been tested in Chrome and Firefox</p>
			
			<form method='POST' action='confirmed.php' id='auth' name='auth' >
			    <label for='email'>User Name</label><input type='text' id='user_name' name='user_name' />
			    <label for='email'>Email</label><input type='text' id='email' name='email' />
			    <label for='email'>Confirm Email</label><input type='text' id='email_confirm' name='email_confirm' />		        
			    <label for='email'>Password</label><input type='password' id='password' name='password' />
			    <label for='email'>Confirm Password</label><input type='password' id='password_confirm' name='password_confirm' />	
			    <input type='button' value='submit' id='signup_submit'>		    
		    </form>
		    
		    <div id='errors'></div>
		    
		</div>
	</body>
</html>		