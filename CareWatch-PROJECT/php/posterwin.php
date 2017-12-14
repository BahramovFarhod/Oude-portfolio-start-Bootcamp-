<?php

include_once 'dbhinc.php';

if (isset($_POST['id'])) { // deze kijkt of iets is gepost of niet.
  $post_ID = $_POST['id']; // deze haalt uit de post en gooit in de varibale.
  $datatype = $_POST['datatype'];
  $datavalue = $_POST['datavalue'];
  $sql = "SELECT * FROM `snsr` WHERE snsr_id=$post_ID"; // deze select from de sensor waar id is gepost.
  $result = mysqli_query($conn,$sql); // deze is voor de resultaat van de sqli query
  while($row = mysqli_fetch_array($result)) {
    $ID = $row[0];
  }
}
if(isset($ID)){
  echo $ID;
  $sql = "INSERT INTO snrd (snrd_id,snrd_type,snrd_val) VALUES ($ID,'$datatype',$datavalue);";
  //run INSERT query and check for errors
  if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
  } else {
    echo "Error: " . $sql . "<br>" . $conn->error;
  }
  if ($datatype = 'heartbeat' && $datavalue > 88) {
    $sql = "INSERT INTO acd (snr_id,acd_message,acd_status) VALUES ($ID,'$datatype',$datavalue);";

  }
}else{
  echo "Not found!";
}
