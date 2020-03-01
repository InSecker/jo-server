const apiKey = 'AIzaSyB6gBeumPXboJsSnraTleLWEnhvu0hQXKk'
const fetch = require("node-fetch")
const mysql = require('mysql')
const apiUrl = "https://maps.googleapis.com/maps/api/place/textsearch/json"

let count = 0 

let finalRestau = [
  {
    district: 1,
    count: 47,
    price_average: 2.5531914893617023,
    rating_average: 4.278723404255319,
    rating_number: 28341,
    value_for_money: 767440.4391666665
  },
  {
    district: 2,
    count: 42,
    price_average: 2.2857142857142856,
    rating_average: 4.285714285714286,
    rating_number: 28219,
    value_for_money: 750488.4645833335
  },
  {
    district: 3,
    count: 42,
    price_average: 2.119047619047619,
    rating_average: 4.314285714285715,
    rating_number: 22210,
    value_for_money: 623652.6191011235
  },
  {
    district: 4,
    count: 49,
    price_average: 2.2448979591836733,
    rating_average: 4.33673469387755,
    rating_number: 27606,
    value_for_money: 876618.3499999999
  },
  {
    district: 5,
    count: 46,
    price_average: 2.217391304347826,
    rating_average: 4.38913043478261,
    rating_number: 15541,
    value_for_money: 486195.58333333326
  },
  {
    district: 6,
    count: 42,
    price_average: 2.4285714285714284,
    rating_average: 4.307142857142857,
    rating_number: 18306,
    value_for_money: 474896.0500000001
  },
  {
    district: 7,
    count: 38,
    price_average: 2.6315789473684212,
    rating_average: 4.3500000000000005,
    rating_number: 11998,
    value_for_money: 278158.686
  },
  {
    district: 8,
    count: 40,
    price_average: 3.05,
    rating_average: 4.2775,
    rating_number: 16097,
    value_for_money: 270770.7016393442
  },
  {
    district: 9,
    count: 39,
    price_average: 2.282051282051282,
    rating_average: 4.36923076923077,
    rating_number: 23853,
    value_for_money: 515614.184269663
  },
  {
    district: 10,
    count: 49,
    price_average: 2.020408163265306,
    rating_average: 4.353061224489796,
    rating_number: 26650,
    value_for_money: 884365.7171717173
  },
  {
    district: 11,
    count: 37,
    price_average: 2.054054054054054,
    rating_average: 4.448648648648649,
    rating_number: 15103,
    value_for_money: 465141.27236842114
  },
  {
    district: 12,
    count: 48,
    price_average: 2,
    rating_average: 4.343750000000001,
    rating_number: 22512,
    value_for_money: 805985
  },
  {
    district: 13,
    count: 50,
    price_average: 1.86,
    rating_average: 4.303999999999999,
    rating_number: 22180,
    value_for_money: 910840.098924731
  },
  {
    district: 14,
    count: 49,
    price_average: 2.2244897959183674,
    rating_average: 4.302040816326529,
    rating_number: 19946,
    value_for_money: 696253.6715596329
  },
  {
    district: 15,
    count: 56,
    price_average: 2.107142857142857,
    rating_average: 4.307142857142856,
    rating_number: 18807,
    value_for_money: 673826.9254237289
  },
  {
    district: 16,
    count: 50,
    price_average: 2.38,
    rating_average: 4.318,
    rating_number: 15958,
    value_for_money: 562766.1168067227
  },
  {
    district: 17,
    count: 48,
    price_average: 2.3541666666666665,
    rating_average: 4.385416666666667,
    rating_number: 12692,
    value_for_money: 405364.15752212395
  },
  {
    district: 18,
    count: 45,
    price_average: 2.088888888888889,
    rating_average: 4.393333333333333,
    rating_number: 14310,
    value_for_money: 447106.7627659574
  },
  {
    district: 19,
    count: 37,
    price_average: 1.972972972972973,
    rating_average: 4.208108108108108,
    rating_number: 13608,
    value_for_money: 376185.96301369864
  },
  {
    district: 20,
    count: 45,
    price_average: 1.9111111111111112,
    rating_average: 4.255555555555555,
    rating_number: 13638,
    value_for_money: 468561.665116279
  }
]

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "paris-jo"
});

// let parameters = {
//   key: apiKey,
//   input: "restaurant Paris 75001"
// }

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

let restaurants = []

async function query(url, district) 
{
  let res = await fetch(url)
  let data = await res.json()
  data.results.forEach(restaurant => {
    restaurants[district].push(restaurant)
  });
  console.log(data)
  if (data.next_page_token) {
    let params = {
      pagetoken: data.next_page_token,
      key: apiKey
    }
    const sendQuery = function () {
      query(buildUrl(apiUrl,params), district)
    }
    setTimeout(()=>{sendQuery()}, 2000)
  } else {
    resturantsInfos(district)
  }
  return data
}

let final = []
const resturantsInfos = function(district) {
  let count = 0
  let priceLevel = 0
  let stars = 0
  let users = 0
  let test = 0
  restaurants[district].forEach(restaurant => {
    //console.log(restaurant)
    if (restaurant.price_level) {
      count ++
      priceLevel += restaurant.price_level
      stars += restaurant.rating
      users += restaurant.user_ratings_total
      test += (stars*users)
    }
  })
  //console.log(priceLevel/count, count, district)
  final[district] = {
    district: district,
    count: count,
    price_average: priceLevel/count,
    rating_average: stars/count,
    rating_number: users,
    value_for_money: (test/count)/(priceLevel/count)
  }
  if (final.length >= 20) {
    console.log(final)
  }
}

for (let i = 1; i <= 20; i++) {
  let district
  if (i >= 10) {
    district = "750" + i
  }else {
    district = "7500"  + i
  }
  console.log(district)
  const sendQuery = function () {
    restaurants[i] = []
    query( buildUrl(apiUrl,{key: apiKey, input: "Restauration Paris " + district}) , i )
  }
  setTimeout( () => {
    sendQuery()
  }, 2000)
}

  // .then(data => console.log(data))
