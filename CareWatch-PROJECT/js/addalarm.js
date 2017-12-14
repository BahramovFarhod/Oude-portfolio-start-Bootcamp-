// array with js object for dummy alarms
var alarms = [{
    client: "Mrs. Graffhof",
    alarmType: "Alarm Button",
    time: "20:12:11",
    Operator: "Emma",
    Status: "New",
  },
  {
    client: "Bep",
    alarmType: "Fallen",
    time: "11:45:43",
    Operator: "Emma",
    Status: "New",
  },
  {
    client: "Mr. Johnson",
    alarmType: "Alarm Button",
    time: "02:13:55",
    Operator: "Emma",
    Status: "New",
  },
  {
    client: "Mr. Alex",
    alarmType: "Hearth Alarm",
    time: "05:25:33",
    Operator: "Betty",
    Status: "New",
  },
  {
    client: "Ms. Oakstein",
    alarmType: "Alarm Button",
    time: "10:43:21",
    Operator: "Emma",
    Status: "New",
  }
]

// add alarm bar to landing page
function addAlarm() {

  var newAlarm = document.createElement("div");
  newAlarm.className = "container";

  var alarmRow = document.createElement("div");
  alarmRow.className = "row alarm newAlarm";

  function addColl(content) {
    var alarmCol = document.createElement("div");
    alarmCol.className = "col";
    alarmCol.innerHTML = content;
    alarmRow.appendChild(alarmCol);
  }

  var x = alarms[Math.floor(Math.random() * alarms.length)];

  addColl(x.client);
  addColl(x.alarmType);
  addColl(x.time);
  addColl(x.Operator);
  addColl(x.Status);

  newAlarm.appendChild(alarmRow);

  document.getElementsByClassName("alarmList")[0].appendChild(newAlarm);
};
