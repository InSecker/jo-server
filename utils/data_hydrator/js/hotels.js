const mysql = require('mysql')

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "paris-jo"
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

const data = require('../hotels.json');

let districts = []
for (let i = 0; i < 20; i++) {
  districts[i] = {
    1: 0,
    2: 0,
    3: 0,
    4: 0,
    5: 0,
    total: 0,
    place: 0
  }
}

for (let i = 0; i < data.length; i++) {
  let hotel = data[i].fields
  if (hotel.departement === 75 ) {
    let district = hotel.code_postal - 75001
    districts[district][hotel.classement.substring(0, 1)] ++
    districts[district].total ++
  }
}

const buildTop = function(array) {
  let totals = []
  for (let i = 0; i < array.length; i++) {
    totals[i] = array[i].total
  }
  totals.sort(function(a, b) {
    return b - a;
  });
  for (let i = 0; i < totals.length; i++) {
    let place = i+1
    for (let j = 0; j < array.length; j++) {
      if(totals[i] === array[j].total) {
        array[j].place = place
      }
    }
  }
}
buildTop(districts)

districts.forEach((district, i) => {
  let area = i+1
  let query = 'INSERT INTO hotel (district, rank, one_star, two_stars, three_stars, four_stars, five_stars, total) VALUES (?,?,?,?,?,?,?,?)'
  con.query(query, [area, district.place, district[1], district[2], district[3], district[4], district[5], district.total], function(err, rows) { console.log(err, rows)})
})

//console.log(districts);
