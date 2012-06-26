<?php
session_start();

if (!isset($_SESSION['user_name']))  {
    echo "<a href='/'><p>YOU ARE NOT AUTHENTICATED!</p></a>";
    exit; 
}
else  {
    $user_id = $_SESSION['user_name'];
}	

?>