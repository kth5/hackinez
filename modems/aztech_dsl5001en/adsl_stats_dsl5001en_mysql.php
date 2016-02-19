<?php
/*
   ADSL Stats Aggregator for Aztech DSL5001EN


*/
error_reporting(~E_DEPRECATED);

define('ROUTER_IP', '192.168.2.1');
define('DBHOST', 'localhost');
define('DBNAME', 'adsl');
define('DBUSER', 'adsl');
define('DBPASS', 'adsl');


$json = file_get_contents('http://192.168.2.1/cgi-bin/adsl_status.asp');

# fix up broken json delivered by status page
$json = str_replace("'", '"', $json);
$json = str_replace('{ ', '{"', $json);
$json = str_replace(', ', ',"', $json);
$json = str_replace(':', '":', $json);

$json = json_decode($json);

$sql = 'INSERT INTO log SET ';

# assemble SQL statement
foreach ($json as $name => $value) {
  $name = strtolower($name);

  # but before we do so, let's get rid of some strings
  $value = str_replace(' dbm', '', $value);
  $value = str_replace(' kbps', '', $value);
  $value = str_replace(' db', '', $value);
  $value = str_replace('N/A', '-1', $value);
  $sql .= "$name = '$value',";  
}

$sql = substr($sql, 0, -1);

if( $mycn = @mysql_connect(DBHOST, DBUSER, DBPASS) ) {
  $mydb = mysql_select_db(DBNAME);
  $ret = mysql_query($sql, $mycn);
  mysql_close($mycn);
} else {
  echo "Cannot connect to database!";
}
