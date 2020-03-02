const mysql = require('mysql');
const stations = require('./stations.json');
const adresses = require('./adresses.json');

const apiKey = 'API-KEY'

console.log("STARTING MYSQL SCRIPT");

for (let i = 0; i < 5; i++) {
  let station2 = stations[i].fields.nomlong
  adresses.forEach(adresse => {
    let adresse2 = adresse.fields.stop_name
    if (adresse2.toLowerCase() === station2.toLowerCase()) {
      console.log(adresse.fields.stop_desc, " : ", stations[i].fields.nomlong)
    }
  })
}

stations.forEach(station => {
  if (station.fields.res_com === "M12") {
    let station2 = station.fields.nomlong
    adresses.forEach(adresse => {
      let adresse2 = adresse.fields.stop_name
      if (adresse2.toLowerCase() === station2.toLowerCase()) {
        console.log(adresse.fields.stop_desc, " : ", station.fields.nomlong, " / ", station.fields.res_com)
      }
    })
  }
});

// var con = mysql.createConnection({
//   host: "localhost",
//   user: "root",
//   password: "root"
// });

// con.connect(function(err) {
//   if (err) throw err;
//   console.log("Connected!");
// });