
<!DOCTYPE html>
<html>
<head>
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.5.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

	<link rel='stylesheet' href="composer/style/style.css" >
    <title> Play -user: <?= $user_id ?></title>

    
</head>
<body>
    
<div id='play'> 
    
    <h1 id='title'><a href='/'>&laquo; Back</a>&nbsp; &nbsp;<? echo $_GET['project_name'] ?></h1>

    <div id="flash"> 
        <object type="application/x-shockwave-flash"  data="composer/flash/random_seed_player.swf?debug=true&project_name=<? echo rawurlencode($_GET['project_name']) ?>&user_name=demo"  width="700" height="700">    	</object>
    </div>
    


</div>    
    
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-29624850-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

</body>
</html>