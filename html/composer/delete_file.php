<?
include('header.php'); 
include('functions.php');

// get the project name from the get string 
$project_name = rawurldecode(rawurldecode($_GET['project_name']));

$file = urldecode($_GET['file']);

if(!isset($user_id)) { 
    $user_id = 'tom';
}

$location  = escapeshellcmd("projects/$user_id/$project_name/$file");
chmod($location, 777);
$value = unlink($location); 

$json['delete'] = $value;
$json = json_encode($json);

header('Cache-Control: no-cache, must-revalidate');
header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
header('Content-type: application/json');

echo $json;

?>