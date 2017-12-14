<?php

include_once 'dbhinc.php';
include_once("classes/device.php");
include_once("classes/datapoint.php");
include_once("classes/alarm.php");

$alarms = Alarm::GetAllAlarms();
echo '[';
for($i = 0; $i < count($alarms); $i++){
  echo json_encode($alarms[$i],JSON_PRETTY_PRINT);
  if($i < count($alarms)-1){
      echo ",";
  }
}
echo ']';
?>
