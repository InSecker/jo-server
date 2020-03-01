const apiKey = 'AIzaSyB6gBeumPXboJsSnraTleLWEnhvu0hQXKk'
const fetch = require("node-fetch")
const mysql = require('mysql')
const url = "https://maps.googleapis.com/maps/api/directions/json"

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "paris-jo"
});

let parameters = {
  key: apiKey,
  mode: "transit",
  departure_time: "1585908000",
}

con.connect(function(err) {
  if (err) throw err;
  con.query("SELECT id_competition, address, city FROM competition", function (err, result, fields) {
    if (err) throw err;

    result.forEach(competition => {
      for (let i = 1; i <= 1; i++) {
        setTimeout(() => {
          parameters.destination = competition.address + ", " + competition.city
          if (competition.id_competition === 40) {
            parameters.destination = "1 Avenue Nicolas About, 78180 Montigny-le-Bretonneux"
          }
          if (i === 1) {
            parameters.origin = "Paris 1er arrondissement"
          } else if (i === 12) {
            parameters.origin = "156 avenue dausmennil, 75012 Paris"
          } else {
            parameters.origin = "Paris "+ i + "eme arrondissement";
          }
          fetch(buildUrl(url, parameters))
            .then(response => response.json())
            .then(response => {
              if (response.status !== "OK") {
                console.log(response.status)
              }
              let duration = response.routes[0].legs[0].duration.value
              duration = Math.round(duration/60)+40
        
              let change = -1
              response.routes[0].legs[0].steps.forEach(element => {
              if (element.travel_mode === "TRANSIT") {
                  change++;
                }
              });
    
              let final = {
                area: i,
                time: duration, 
                correspondence: change,
                id_competition: competition.id_competition,
              }
              if (competition.id_competition === 40) {
                final.time += 30
              }
              console.log(final.time, competition.id)
              // let query = 'INSERT INTO travel (area, time, correspondence, id_competition) VALUES (?,?,?,?)'
              // con.query(query, [final.area, final.time, final.correspondence, final.id_competition], function(err, rows) {console.log(err, rows)})
            })
        }, 1000*i)
      }
    });


    // competitions.forEach(competition => {
    //   let competitionAddress = competition.address + ", " + competition.city
    
    //   parameters.origin = "Paris 20eme Arrondissement"
    //   parameters.destination = competitionAddress
    
    //   fetch(buildUrl(url, parameters))
    //     .then(response => response.json())
    //     .then(response => {
    //       console.log(response.status, competitionAddress)
    //       let duration = response.routes[0].legs[0].duration.value
    //       duration = Math.round(duration/60)
    
    //       let change = -1
    //       response.routes[0].legs[0].steps.forEach(element => {
    //         if (element.travel_mode === "TRANSIT") {
    //           change++;
    //         }
    //       });
    
    //       let final = {
    //         area: 20,
    //         time: duration, 
    //         correspondence: change,
    //         id_competition: competition.id_competition
    //       }
    //       let query = 'INSERT INTO travel (area, time, correspondence, id_competition) VALUES (?,?,?,?)'
    //       con.query(query, [final.area, final.time, final.correspondence, final.id_competition], function(err, rows) { console.log(err, rows)})
    //     }
    //     , error => {
    //         console.error(error);
    //     });
      
    // });    

  });
});

const buildUrl = function(url, parameters) {
  let queryString = ""
  for(var key in parameters) {
    var value = parameters[key];
    queryString += encodeURIComponent(key) + "=" + encodeURIComponent(value) + "&";
  }
  if (queryString.length > 0){
    queryString = queryString.substring(0, queryString.length-1); //chop off last "&"
    url = url + "?" + queryString;
  }
  return url;
}
