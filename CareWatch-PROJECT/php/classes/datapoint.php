<?php
class DataPoint implements JsonSerializable {
  var $id;
  var $value;
  var $time;
  var $sensor;



  public static $instances = array();

  public static function Instance($id){
    if(array_key_exists($id,DataPoint::$instances)){
      return DataPoint::$instances[$id];
    }else{
      $obj = new DataPoint($id);
      DataPoint::$instances[$id] = $obj;
      return $obj;
    }
  }
  public static function Create($value,$sensor){
    $obj = new DataPoint(false,$value,$sensor);
    return $obj;
  }

  function __construct($id,$value=false,$sensor=false){

    if(!$id){
      $this->value = $value;
      $this->sensor = $sensor;
      $this->create_new();
    }else{
      $this->id = $id;
    }
    $this->get_data();
  }

  function get_data(){
    global $conn;
    $sql = "SELECT * FROM snrd WHERE snrd_id = $this->id";
    $result = mysqli_query($conn,$sql);
    while($row = mysqli_fetch_array($result)){
      $this->value = $row[1];
      $this->time = $row[2];
      $this->sensor = Sensor::Instance($row[3]);
    }
  }
  function create_new(){
    global $conn;
    $sensor_id = $this->sensor->id;
    $sql = "INSERT INTO snrd (snrd_val,snsr_tijd, snsr_id) VALUES ($this->value,now(),$sensor_id)";
    if(mysqli_query($conn,$sql) === TRUE){
      $this->id = $conn->insert_id;
    }
  }
  public function jsonSerialize() {
            return [
                'value' => $this->value,
                'time' => $this->time,
                'sensor' => $this->sensor->jsonSerialize()
            ];
        }


} ?>
