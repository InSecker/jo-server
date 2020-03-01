const fetch = require("node-fetch")
const mysql = require('mysql')

const url = "https://opendata.paris.fr/api/records/1.0/search/"

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "paris-jo"
});

for (let i = 1; i <= 20; i++) {
  let query = 'INSERT INTO districts VALUES (?,?,?,?)'
  con.query(query,[i,i,i,i], function(err, rows) { console.log(err, rows)})
}