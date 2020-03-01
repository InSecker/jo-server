const data = require('../restosss.json');
const fetch = require("node-fetch")

let districts = [
  { unknown: 152, low: 89, medium: 380, high: 60, total: 681 },
  { unknown: 212, low: 83, medium: 357, high: 34, total: 686 },
  { unknown: 129, low: 60, medium: 222, high: 10, total: 421 },
  { unknown: 121, low: 59, medium: 295, high: 16, total: 491 },
  { unknown: 211, low: 123, medium: 401, high: 24, total: 759 },
  { unknown: 144, low: 63, medium: 369, high: 47, total: 623 },
  { unknown: 94, low: 31, medium: 253, high: 56, total: 434 },
  { unknown: 296, low: 63, medium: 387, high: 145, total: 891 },
  { unknown: 339, low: 139, medium: 515, high: 31, total: 1024 },
  { unknown: 293, low: 124, medium: 378, high: 10, total: 805 },
  { unknown: 358, low: 141, medium: 509, high: 24, total: 1032 },
  { unknown: 227, low: 73, medium: 277, high: 14, total: 591 },
  { unknown: 199, low: 108, medium: 245, high: 4, total: 556 },
  { unknown: 159, low: 61, medium: 306, high: 15, total: 541 },
  { unknown: 319, low: 80, medium: 450, high: 23, total: 872 },
  { unknown: 86, low: 16, medium: 133, high: 23, total: 258 },
  { unknown: 270, low: 84, medium: 440, high: 44, total: 838 },
  { unknown: 246, low: 89, medium: 385, high: 14, total: 734 },
  { unknown: 172, low: 53, medium: 125, high: 3, total: 353 },
  { unknown: 166, low: 60, medium: 150, high: 4, total: 380 }
]
for (let i = 0; i < 20; i++) {
  console.log(i+1, districts[i])
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

const mysql = require('mysql')

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "paris-jo"
});

districts.forEach((district, i) => {
  let query = 'INSERT INTO restaurant (restaurant_district, rank, unknown_prices, low_prices, medium_prices, high_prices, total) VALUES (?,?,?,?,?,?,?)'
  con.query(query, [i+1, district.place, district.unknown, district.low, district.medium, district.high, district.total], function(err, rows) { console.log(err, rows)})
});

let  count = 0
// data.forEach(resto => {
//   if (count > 13000 && count <= 15000) {
//     tripadvisor("https://www.tripadvisor.fr" + resto.url)
//       .then(res => {
//         if (res) {
//           if (resto.price === "$$$$") {
//             districts[res-1].high++
//           } else if (resto.price === "$$ - $$$") {
//             districts[res-1].medium++
//           } else if (resto.price === "$") {
//             districts[res-1].low++
//           } else {
//             districts[res-1].unknown++
//           }
//           districts[res-1].total++
//           console.log(districts, buildTotal())
//         }
//       })
//   }
//   count++
// });

function buildTotal() {
  let counter = 0
  districts.forEach(district => {
    counter += district.total
  });
  return counter
}

async function tripadvisor(url) {
  let response = await fetch(url)
  let data = await response.text()
  data = data.substring(data.indexOf("locality"), data.indexOf("locality")+15)
  data = data.replace(`locality">`, "")
  data -= 75000
  if (data > 0 && data <= 20) {
    return data
  } else {
    return null
  }
}
