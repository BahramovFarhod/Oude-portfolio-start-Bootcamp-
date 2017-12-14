<?php
include_once("classes/datapoint.php");
include_once("dbhinc.php");

class Alarm implements JsonSerializable{
  var $state;
  var $datapoint;
  var $id;

  public static $instances = array();

  public static function Instance($id){
    if(array_key_exists($id,Alarm::$instances)){
      return Alarm::$instances[$id];
    }else{
      $obj = new Alarm($id);
      Alarm::$instances[$id] = $obj;
      return $obj;
    }
  }
  public static function GetAllAlarms(){
    global $conn;
    $returns = array();
    $sql = "SELECT id FROM snra;";
    $result = mysqli_query($conn,$sql);
    while($row = mysqli_fetch_array($result)){
      $returns[] = Alarm::Instance($row[0]);
    }
    return $returns;
  }
  public static function Create($datapoint){
    $obj = new Alarm(false,$datapoint);
    return $obj;
  }
  function create_new(){
    global $conn;
    $sql = "INSERT INTO snra (snrd_id,state) VALUES (".$this->datapoint->id.",1)";
    if(mysqli_query($conn,$sql) === TRUE){
      $this->id = $conn->insert_id;
    }else{echo "Failed!";}
  }
  function __construct($id,$datapoint=false){

    if(!$id){
      $this->state = 1;
      $this->datapoint = $datapoint;
      $this->create_new();
    }else{
      $this->id = $id;
    }
    $this->get_data();
  }

  function get_data(){
    global $conn;
    $sql = "SELECT * FROM snra WHERE id = $this->id;";
    $result = mysqli_query($conn, $sql);
    while($row = mysqli_fetch_array($result)){
      $this->datapoint = DataPoint::Instance($row[1]);
      $this->state = $row[2];
    }
  }
  public function jsonSerialize() {
            return [
                'state' => $this->state,
                'datapoint' => $this->datapoint->jsonSerialize()
            ];
        }
} ?>
