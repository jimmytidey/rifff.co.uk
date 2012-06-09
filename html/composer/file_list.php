<?
include('header.php'); 
include('functions.php');

$project_name =$_GET['project_name'];

if(!isset($user_id)) { 
    $user_id = 'tom';
}

$list = structure_list("projects/$user_id/$project_name", 'file');
if (empty($list)) { 
    $list[0] = 'No files. Sorry';
}

sort($list);

$json = array();

$json['files'] = $list;
$json['user_id'] = "projects/$user_id/$project_name";  
$json = json_encode($json);

header('Cache-Control: no-cache, must-revalidate');
header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
header('Content-type: application/json');

echo $json;

?>