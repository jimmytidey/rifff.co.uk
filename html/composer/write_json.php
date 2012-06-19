<?
include('header.php'); 
include('functions.php');
// get the project name from the get string 
$project_name = rawurldecode(rawurldecode($_POST['project_name']));
$user_id = rawurldecode(rawurldecode($_POST['user_name']));

$json = stripslashes(urldecode($_POST['json']));

if(!isset($user_id)) { 
    $user_id = 'tom';
}   
 	
write_json("projects/$user_id/$project_name/list.json", $json);

header('Cache-Control: no-cache, must-revalidate');
header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
header('Content-type: application/json');

$file_json = read_json("projects/$user_id/$project_name/list.json");
echo $file_json;


?>