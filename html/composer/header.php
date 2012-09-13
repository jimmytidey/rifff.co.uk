<?php session_start();

if (!isset($_SESSION['user_name']))  {
    $_SESSION['user_name'] = 'jimmytidey';
}
else  {
    $user_id = $_SESSION['user_name'];
}	

?>