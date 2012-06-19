<? include('header.php') ?>



<!DOCTYPE html>
<html>
<head>
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.5.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

	<link rel='stylesheet' href="style/style.css" >
    <title> Edit -user: <?= $user_id ?></title>

    
</head>
<body>
    
<div id='edit'> 
    
    <h1 id='title'><a href='../composer/'>&laquo; Back</a>&nbsp; &nbsp;<? echo $_GET['project_name'] ?></h1>
    <h1 id='files'><a href="upload/index.php?project_name=<? echo $_GET['project_name'] ?>" target='_blank'>Sample Upload</a></h1> 
  
    <br/> <br/><br/> <br/>
  	<p><a href='#help' class='help_link' > Click here for help</a></p>
    <p><a href='play.php?project_name=<?= $_GET['project_name'] ?>' target='_blank' class='help_link' > Click here to view the player</a></p>

    <div id="flash"> 
    	<object type="application/x-shockwave-flash"  data="flash/random_seed_composer.swf?debug=false&project_name=<? echo rawurlencode($_GET['project_name']) ?>&user_name=<? echo $_SESSION['user_id'] ?>"  width="960" height="2600">
    	</object>
    </div>
    
 
    
</div>    
    


<? include('footer.php') ?>


