const apiKey = 'API-KEY'
const fetch = require("node-fetch")
const mysql = require('mysql')
const apiUrl = "https://maps.googleapis.com/maps/api/place/textsearch/json"
const jsdom = require("jsdom");
const csv = require('csv-parser')
const fs = require('fs')
var createHTML = require('create-html')
const results = [];



// let student = { 
//   name: 'Mike',
//   age: 23, 
//   gender: 'Male',
//   department: 'English',
//   car: 'Honda' 
// };

// let data = JSON.stringify(student);
// fs.writeFileSync('student-2.json', data);

let restos = []
fs.createReadStream('./resto.csv')
  .pipe(csv())
  .on('data', (data) => results.push(data))
  .on('end', () => {
    results.forEach(resto => {
      if (resto.City === "Paris") (
        restos.push({
          url : resto.URL_TA,
          price : resto['Price Range'],
          ranking : resto.Ranking,
        })
      )
    })
    let data = JSON.stringify(restos);
    fs.writeFileSync('restosss.json', data);
  })

// let districts = []
// for (let i = 0; i < 20; i++) {
//   districts[i] = {
//     district: i+1,
//     unknown : 0,
//     low: 0,
//     medium: 0,
//     high: 0,
//     total: 0
//   }
// }

// let count = 0
// fs.createReadStream('./resto.csv')
//   .pipe(csv())
//   .on('data', (data) => results.push(data))
//   .on('end', () => {
//     let  loopCount = 0 
//     results.forEach(resto => {
//       if (resto.City === "Paris") {
//         tripadvisor("https://www.tripadvisor.fr" + resto.URL_TA)
//           .then(arr => {
//             if (arr && loopCount < 1000) {
//                 districts[arr].total++
//                 if (resto[`Price Range`] === "$$$$") {
//                   districts[arr].high++
//                 } else if (resto[`Price Range`] === "$$ - $$$") {
//                   districts[arr].medium++
//                 } else if (resto[`Price Range`] === "$") {
//                   districts[arr].low++
//                 } else {
//                   districts[arr].unknown++
//                 }
//               }
//               console.log(districts)
//           })
//         loopCount++
//       }
//     });
//   });

// async function tripadvisor(url) {
//   let response = await fetch(url)
//   let data = await response.text()
//   // data = data.substring(data.indexOf("locality) + 1);
//   data = await data.substring(data.indexOf("locality"), data.indexOf("locality")+15)
//   data = await data.replace(`locality">`, "")
//   data -= await 75001
//   count++
//   if (data >= 0 && arr < 20) {
//     return data
//   } else {
//     return null
//   }
// }

// // const test = async function(url, priceRange) {
// //   let call = await fetch(url)
// //   call = call.text()
// //   const parser = new jsdom.JSDOM(call).window;
// //   const section = parser.document.querySelector("span.locality").innerHTML;
// //   console.log(section, )
// //   let arr = section.replace(" Paris,", "")
// //   arr -= 75001
// //   if (arr >= 0 && arr < 20) {
// //     count++
// //     districts[arr].total++
// //     if (priceRange === "$$$$") {
// //       districts[arr].high++
// //     } else if (priceRange === "$$ - $$$") {
// //       districts[arr].medium++
// //     } else if (priceRange === "$") {
// //       districts[arr].low++
// //     } else {
// //       districts[arr].unknown++
// //     }
// //   }
// //   if (count === 100) {
// //     console.log(districts)
// //   }

// // }

