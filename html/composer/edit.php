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

    <div id="flash"> 
    	<object type="application/x-shockwave-flash"  data="flash/random_seed_composer.swf?debug=false&project_name=<? echo rawurlencode($_GET['project_name']) ?>&username=<? echo $_SESSION['user_id'] ?>"  width="960" height="2600">
    	</object>
    </div>
    
    <div class='help'> 
        <h1><a name='help'>Help</a></h1>

        <strong>Rifff will not play back properly until all samples have uploaded fully, as indicated by the percentages at the bottom of the screen.</strong>

        <h2>What is this?</h2> 
        <p>Rifff is a composition tool. It is for composing music with an element of random.</p>

        <p>It functions exactly like an audio sequencer, with each step of the sequence triggering a sample.</p> 

        <p>However, as well as specifying that a sample should play or should not play, you can specify a 33% or 66% likelihood.</p>

        <h2>How does it work</h2> 
        <p>At the top of the screen are the settings for your composition: 
        
        <ul> 
            <li><em>BPL</em> beats per loop - bar length</li>
            <li><em>BPM</em> Beats per minute</li>
            <li><em>Number of steps</em> the total length of the composition.</li> 
        </ul>

        <p>There are buttons to play, step forward, step backwards and rewind to the beginning. There is also a randomise button. Every time you press this button a new set of samples will be chosen from the options you have selected on the grid.</p> 

        <p>The samples are divided into <em>banks</em>. Only one sample from each bank will play at a time.</p> 

        <p>Against each bank there are two settings and a volume slider. The first setting <em>Loop</em> only takes affect if the mp3 file uploaded is shorter than a bar in your compisition. If this setting is selected the sample will loop unitl the end of the bar. The overplay setting only takes affect if your uploaded mp3 is longer than a bar. If it is selected it will cause the sample to play to the end, rather than cutting it off at the end of the bar.</p> 

        <p>SEEMLESS LOOPING between steps of the composition can also be achieved by selecting two steps in a row, and selecting the "loop" button.</p>

        <h2>Uploading</h2> 
        <p>On the top right is the uploaded link, you can upload multiple files at a time. </p> 

        <p>Once samples have uploaded, you need to press the Reload Samples button at the bottom of the composition screen.</p>
        <p>Uploading samples with the same name will over-write pervious samples.</p>
        <p>To select a sample for use in your composition, just use the drop downs next to the volume slider.</p>

    </div>
    
</div>    
    


<? include('footer.php') ?>


