<?php
class Sensor implements JsonSerializable {
  var $id;
  var $serial;
  var $location;
  var $type;
  var $device;

  public static $instances = array();
  public static function Instance($id){
    if(array_key_exists($id,Sensor::$instances)){
      return Sensor::$instances[$id];
    }else{
      $obj = new Sensor($id);
      Sensor::$instances[$id] = $obj;
      return $obj;
    }
  }

  function __construct($id){
    $this->id = $id;
    $this->get_sensor_data();
  }
  function get_sensor_data(){
    global $conn;
    $sql = "SELECT * FROM snsr WHERE snsr_id = $this->id";
    $result = mysqli_query($conn,$sql);
    while($row = mysqli_fetch_array($result)){
      $this->serial = $row[1];
      $this->location = $row[2];
      $this->device = Device::Instance($row[3]);
      $this->type = $row[4];
    }
  }
  public function jsonSerialize() {
            return [
                'id' => $this->id,
                'serialnr' => $this->serial,
                'location' => $this->location,
                'type' => $this->type,
                'device' => $this->device->jsonSerialize(),
            ];
        }




}
 ?>
