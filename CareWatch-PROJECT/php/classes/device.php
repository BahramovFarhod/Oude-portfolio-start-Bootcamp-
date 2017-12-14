<?php


include_once("dbhinc.php");
include_once("classes/naw.php");
include_once("classes/sensor.php");

  class Device implements JsonSerializable {
    var $id;
    var $name;
    var $owner;

    var $sensors;

    public static $instances = array();
    public static function Instance($id){
      if(array_key_exists($id,Device::$instances)){
        return Device::$instances[$id];
      }else{
        $obj;
        try{
          $obj = new Device($id);
        } catch(Exception $e){
            return false;
        }
        Device::$instances[$id] = $obj;
        return $obj;
      }
    }


    function __construct($id){
      $this->id = $id;
      if(!$this->check_if_exists()){
        throw new Exception("ID does not exist in database!");
      }
      $this->create_device_with_id();
    }

    function check_if_exists(){
      global $conn;
      $exists = mysqli_num_rows(mysqli_query($conn,"SELECT id FROM devices WHERE id = $this->id")) > 0;
      if(!$exists){
        return false;
      }
      return true;
    }

    function create_device_with_id(){
      global $conn;
      $sql = "SELECT * FROM devices WHERE id = $this->id";
      $result = mysqli_query($conn,$sql);

       while($row = mysqli_fetch_array($result)){
         $this->name = $row[1];
         $this->owner = NAW::Instance($row[2]);
       }
    }
    function get_sensors(){
      global $conn;
      $sql = "SELECT s.snsr_id FROM snsr s JOIN devices d ON s.snsr_device_id = d.id WHERE d.id = $this->id;";
      $result = mysqli_query($conn,$sql);
      while($row = mysqli_fetch_array($result)){
        $this->sensors[] = Sensor::Instance($row[0]);
      }
      return $this->sensors;
    }
    function get_sensor_by_type($type){
      global $conn;
      $sql = "SELECT s.snsr_id FROM snsr s JOIN devices d ON s.snsr_device_id = d.id WHERE d.id = $this->id AND s.type LIKE '$type';";
      $result = mysqli_query($conn,$sql);
      while($row = mysqli_fetch_array($result)){
        return Sensor::Instance($row[0]);
      }
    }
    public function jsonSerialize() {
              return [
                  'id' => $this->id,
                  'name' => $this->name,
              ];
          }
  }?>
