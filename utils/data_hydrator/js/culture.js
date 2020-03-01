const mysql = require('mysql')

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "paris-jo"
});

const interesetPoints = require('../culture.json');

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

buildTop(interesetPoints)

interesetPoints.forEach(interesetPoint => {
  console.log(interesetPoint)
  let query = 'INSERT INTO culture (district, rank, museum, theater, monument, total) VALUES (?,?,?,?,?,?)'
  con.query(query, [interesetPoint.district, interesetPoint.place, interesetPoint.museum, interesetPoint.theater, interesetPoint.monuments, interesetPoint.total], function(err, rows) { console.log(err, rows)})
});
