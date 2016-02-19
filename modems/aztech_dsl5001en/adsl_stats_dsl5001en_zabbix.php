<?php
/*
   ADSL Stats Aggregator for Aztech DSL5001EN


*/
error_reporting(~E_DEPRECATED);

define('ROUTER_IP', '192.168.2.1');
define('ZBXSRV', 'localhost');
define('ZBXPRT', '10051');
define('ZBXHST', 'localhost');

$json = file_get_contents('http://192.168.2.1/cgi-bin/adsl_status.asp');

# fix up broken json delivered by status page
$json = str_replace("'", '"', $json);
$json = str_replace('{ ', '{"', $json);
$json = str_replace(', ', ',"', $json);
$json = str_replace(':', '":', $json);

$json = json_decode($json);

# assemble SQL statement
foreach ($json as $name => $value) {
  $name = strtolower($name);

  # but before we do so, let's get rid of some strings
  $value = str_replace(' dbm', '', $value);
  $value = str_replace(' kbps', '', $value);
  $value = str_replace(' db', '', $value);
  $value = str_replace('N/A', '0', $value);

  //echo '/usr/bin/zabbix_sender -z ' . ZBXSRV . ' -p ' . ZBXPRT . ' -k ' . $name . ' -o "' . $value . '"';
  exec('/usr/bin/zabbix_sender -z ' . ZBXSRV . ' -p ' . ZBXPRT . ' -s ' . ZBXHST . ' -k ' . $name . ' -o "' . $value . '"', $output);
}
