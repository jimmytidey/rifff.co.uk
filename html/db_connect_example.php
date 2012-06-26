<? 
$dbhost = 'jimmysdb.db.4949014.hostedresource.com';
$dbuser = 'jimmysdb';
$dbpass = 'Drowssap1';

$conn = mysql_connect($dbhost, $dbuser, $dbpass) or die ('Error connecting to mysql');

$dbname = 'jimmysdb';
mysql_select_db($dbname);

?>