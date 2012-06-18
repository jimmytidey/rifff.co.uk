<? include('header.php') ?>



<!DOCTYPE html>
<html>
<head>
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.5.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

	<link rel='stylesheet' href="style/style.css" >
    <title> Play -user: <?= $user_id ?></title>

    
</head>
<body>
    
<div id='play'> 
    
    <h1 id='title'><a href='../composer/'>&laquo; Back</a>&nbsp; &nbsp;<? echo $_GET['project_name'] ?></h1>

    <div id="flash"> 
        <object type="application/x-shockwave-flash"  data="flash/random_seed_player.swf?debug=false&project_name=<? echo rawurlencode($_GET['project_name']) ?>&username=<? echo $_SESSION['user_id'] ?>"  width="700" height="700">    	</object>
    </div>
    


</div>    
    


<? include('footer.php') ?>


