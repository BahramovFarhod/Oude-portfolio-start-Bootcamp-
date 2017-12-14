<?php

include_once("dbhinc.php");
class NAW {

  //Database Variables
  var $id;
  var $first_name;
  var $middle_name;
  var $last_name;
  var $gender;
  var $date_of_birth;
  var $bsn_number;
  var $address;
  var $postcode;
  var $hometown;
  var $country;
  var $email;
  var $username;
  var $sec_level;


  var $devices;

  public static $instances = array();

  public static function Instance($id){
    if(array_key_exists($id,NAW::$instances)){
      return NAW::$instances[$id];
    }else{
      $obj = new NAW($id);
      NAW::$instances[$id] = $obj;
      return $obj;
    }
  }
  function __construct($id){
    $this->id = $id;
    $this->create_owner_with_id();
  }

  function create_owner_with_id(){
    global $conn;
    $sql = "SELECT * FROM naw WHERE naw_id = $this->id;";
    $result = mysqli_query($conn,$sql);

    while($row = mysqli_fetch_array($result)){
      $this->first_name = $row[2];
      $this->middle_name = $row[3];
      $this->last_name = $row[4];
      $this->gender = $row[5];
      $this->date_of_birth = $row[6];
      $this->bsn_number = $row[7];
      $this->address = $row[8];
      $this->postcode = $row[9];
      $this->hometown = $row[10];
      $this->country = $row[11];
      $this->email = $row[12];
      $this->username = $row[13];
      $this->sec_level = $row[14];
    }
  }
  function get_full_name(){
    return $this->first_name." ".$this->middle_name." ".$this->last_name;
  }

  function get_devices_for_user(){
    global $conn;
    $sql = "SELECT d.id FROM devices d JOIN permission_link pl ON pl.device_id = d.id JOIN naw n ON pl.naw_id = n.naw_id WHERE n.naw_id = $this->id;";
    $result = mysqli_query($conn,$sql);
    $this->devices = array();
    while($row = mysqli_fetch_array($result)){
      $this->devices[] = Device::Instance($row[0]);
    }
  }
} ?>
