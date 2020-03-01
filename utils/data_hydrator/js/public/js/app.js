let paths = document.querySelectorAll('path');

function loadJSON(callback) {   

  var xobj = new XMLHttpRequest();
      xobj.overrideMimeType("application/json");
  xobj.open('GET', '../../data.json', true);
  xobj.onreadystatechange = function () {
        if (xobj.readyState == 4 && xobj.status == "200") {
          callback(xobj.responseText);
        }
  };
  xobj.send(null);  
}
var data = []

loadJSON(function(response) {
  // Parse JSON string into object
  data = JSON.parse(response);

  paths.forEach(path => {
    data.forEach(area => {
      if (path.getAttribute('area') == area.area) {
        let red = 0;
        let green = 0;
        let rate = area.rate
        if (rate >= 50) {
          green = 255
          red = -((rate-50-50)/50)*255
        } else {
          red = 255
          green = -((50-50-rate)/50)*255
          console.log(green)
        }
        let color = "rgb(" + red + "," + green + ",0)"
        path.setAttribute("fill", color)
        //console.log(area.rate)
      }
    })
  })
})



//element.setAttribute("fill", "rgb(255,0,0)")