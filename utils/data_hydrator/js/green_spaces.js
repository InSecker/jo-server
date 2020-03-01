const fetch = require("node-fetch")
const mysql = require('mysql')

const url = "https://opendata.paris.fr/api/records/1.0/search/"

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

let parameters = {
  dataset: "espaces_verts",
  "exclude.type_ev": "Jardins+privartifs",
  "exclude.type_ev": "Etablissements+sportifs",
  rows: 2000
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

let greenSpaces = []

const apiCall = function() {
  for (let i = 1; i <= 20; i++) {
    let zipCode
    if (i < 10) {
      zipCode = "7500" + i
    } else {
      zipCode = "750" + i
    }
    parameters["refine.adresse_codepostal"] = zipCode
  
    let object = {
      district: zipCode-75000,
      publicSpace: 0,
      garden: 0,
      park: 0,
      total: 0,
      place: 0
    }
  
    fetch(buildUrl(url, parameters))
    .then(response => response.json())
    .then(response => {
      response.records.forEach(record => {
        if (record.fields.poly_area) {
          switch (record.fields.type_ev) {
            case "Bois":
              object.park += Math.round(record.fields.poly_area/10)
              break;
            case "Cimetières":
              object.park += record.fields.poly_area
              break;
            case "Décorations sur la voie publique":
              object.publicSpace += record.fields.poly_area
              break;
            case "Ephémères, partagés, pédagogiques":
              object.garden += record.fields.poly_area
              break;
            case "Jardinets décoratifs":
              object.garden += record.fields.poly_area
              break;
            case "Murs végétalisés":
              object.publicSpace += record.fields.poly_area
              break;
            case "Promenades ouvertes":
              object.park += record.fields.poly_area
              break;
          }
        }
      });
      object.total = object.publicSpace + object.garden + object.park
      greenSpaces.push(object)
      if (greenSpaces.length === 20) {
        buildTop(greenSpaces)
        greenSpaces.forEach(greenSpace => {
          let query = 'INSERT INTO nature (district, rank, green_space, garden, park, total) VALUES (?,?,?,?,?,?)'
          con.query(query, [greenSpace.district, greenSpace.place, greenSpace.publicSpace, greenSpace.garden, greenSpace.park, greenSpace.total], function(err, rows) { console.log(err, rows)})
        })
      }
      setTimeout(function() {}, 200);
    })
  }
}
apiCall()
