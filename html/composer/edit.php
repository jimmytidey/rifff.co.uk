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
  

  	<p><a href='#help'> Click here for help</a></p>

    <div id="flash"> 
    	<object type="application/x-shockwave-flash"  data="flash/random_seed_composer.swf?debug=false&project_name=<? echo rawurlencode($_GET['project_name']) ?>&username=<? echo $_SESSION['user_id'] ?>"  width="960" height="2600">
    	</object>
    </div>
    
    <h1><a name='help'>Help</a></h1> 
    <h2>What is this?</h2> 
    <p>Rifff is a composition tool. It is for composing music with an element of random.</p>

    <p>It functions exactly like an audio sequencer, with each step of the sequence triggering a sample</p> 

    <p>However, as well as specifying that a sample should play or should not play, you can specify a 33% or 66% likelihood</p>

    <h1>How does it work</h1> 
    <p>Within each bank only one sample will ever play back at a time. So if you put all of you drum loops in one bank you can be assured that only one drum loop will play at a time.</p>

    <p>If more than one option has been selected to play, then each time randomise button is pressed a "coing will be tossed" and a differnt selection made.</p> 
    
    
</div>    
    


<? include('footer.php') ?>


