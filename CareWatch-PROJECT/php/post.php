<?php

include_once("dbhinc.php");
include_once("classes/device.php");
include_once("classes/datapoint.php");
include_once("classes/alarm.php");

if (isset($_POST['id'])) {
  $device = Device::Instance($_POST['id']);
  if(!$device == false){
    $sensor = $device->get_sensor_by_type($_POST['datatype']);

    $dp = DataPoint::Create($_POST['datavalue'],$sensor);

    if($_POST['datatype'] == "button"){
      echo json_encode(Alarm::Create($dp),JSON_PRETTY_PRINT);
    }
    elseif(($_POST['datatype'] == "temperature") and ($_POST['datavalue'] >= 24)){
      echo json_encode(Alarm::Create($dp),JSON_PRETTY_PRINT);
    }
    elseif(($_POST['datatype'] == "heartbeat") and ($_POST['datavalue'] >= 55)){
      echo json_encode(Alarm::Create($dp),JSON_PRETTY_PRINT);
    }
    elseif($_POST['datatype'] == "fallen") {
      echo json_encode(Alarm::Create($dp),JSON_PRETTY_PRINT);
    }
    echo json_encode($dp, JSON_PRETTY_PRINT);
  }
}
