<? include('header.php') ?>



<!DOCTYPE html>
<html>
<head>
    
    	<script type="text/javascript" src="http://code.jquery.com/jquery-1.5.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

	<link rel='stylesheet' href="style/style.css" >


    
</head>
<body>
    
<div id='edit'> 
    
    <h1 id='title'><a href='../composer/'>&laquo; Back</a>&nbsp; &nbsp;<? echo $_GET['project_name'] ?></h1>
    <h1 id='files'><a href="upload/index.php?project_name=<? echo $_GET['project_name'] ?>" target='_blank'>Sample Upload</a></h1> 
  
    <div id="flash"> 
    	<object type="application/x-shockwave-flash"  data="flash/random_seed_composer.swf?project_name=<? echo rawurlencode($_GET['project_name']) ?>&username=<? echo $_SESSION['user_id'] ?>"  width="960" height="2600">
    	</object>
    </div>
    

    
</div>    
    


<? include('footer.php') ?>


