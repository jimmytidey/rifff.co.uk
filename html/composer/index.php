<?
include('header.php');
include('functions.php'); 

if (!is_dir('projects/'.$user_id)) { 
    mkdir('projects/'.$user_id, 0777);    
}

if (!empty($_POST['project_name'])) 

{
	$project_name = $_POST['project_name']; 
	
	if (is_dir('projects/'.$user_id.'/'.$project_name)) {
		echo "this project name already exists"; 
	}
	
	else {
		//make the project folder
		mkdir('projects/'.$user_id.'/'.$project_name, 0777);
		
		//copy template into the file 
		$src = "list.json";
		$dest = escapeshellarg('projects/'.$user_id.'/'.$project_name);
		shell_exec("chmod -R -f 777 $dest"); 
		shell_exec("cp -r $src $dest");
	}
}

include('authenticated.php');
 
?>







