

var timerID = setInterval(function() {
  // maak hier een AJAX request naar je PHP script om de alarmen op te vragen en druk deze hier onder af met console.log()
  $.ajax({
        url: 'alarms.php',
        type: 'post',
        success: function(data, status) {
          console.log(data);
          var list = document.getElementById("content");
          while (list.firstChild) {
            list.removeChild(list.firstChild);
          }
          var p = document.createElement("p");
          var text = document.createTextNode(data);
          p.appendChild(text);
          list.appendChild(p);
        },
        error: function(xhr, desc, err) {
          url: 'http://carew.oudgenoeg.nl/php/index.php'(xhr);
          console.log("Details: " + desc + "\nError:" + err);
        }
      }); // end ajax call
}, 1 * 1000);

//clearInterval(timerID);
