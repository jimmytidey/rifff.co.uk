<!DOCTYPE html>
<html>
<head>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

	<link rel='stylesheet' href="style/style.css" >
</head>
<body>


<div id='home_page'> 
	
	<h1 id='title'>RIFFF V2  -user - <?= $user_id ?></h1>
	
	
	<form method="post" action="index.php">
		
		<h3>Add new project</h3>
		<p><input type='text' id='project_name' name='project_name' value='new project name' /><input type='submit' value='save new project' id='save_project_button' /></p>
		 
		
	</form> 
	
	<h3>Existing projects</h3> 
	<?
	

	// get each entry
	$folder_array = structure_list('projects/'.$user_id.'/', 'dir');
		
	
	if (!empty($folder_array)) { 
    	foreach($folder_array as $project) {
		
    		$encoded_name = urlencode($project);
		
    		echo "<a href='edit.php?project_name=$encoded_name'>$project</a><br/>";
	
    	}
    }	
    
    else { 
        echo "You don't have any projects yet";
    }
	
	
	?>
	
</div>