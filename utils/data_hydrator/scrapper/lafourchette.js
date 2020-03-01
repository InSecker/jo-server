const puppeteer = require('puppeteer')
var randomUseragent = require('random-useragent')

const getData = async () => {
  const args = [
    '--no-sandbox',
    '--disable-setuid-sandbox',
    '--disable-infobars',
    '--window-position=0,0',
    '--window-size=1200,750',
    '--ignore-certifcate-errors',
    '--ignore-certifcate-errors-spki-list',
    '--user-agent="' + randomUseragent.getRandom() + '"',
    '--accept-language="en,en-US;q=0,5"',
    '--accept="text/html,application/xhtml+xml,application/xml;q=0.9,/;q=0.8"'
  ];
  console.log(args)
  // 1 - Créer une instance de navigateur
  const browser = await puppeteer.launch({ headless: false, args})
  const page = await browser.newPage()

  let test = []

  // 3 - Récupérer les données
  const result = await page.evaluate(() => {
    let data = []
    let restaurants =  document.querySelectorAll('.resultItem')
    restaurants.forEach(restaurant => {
      let address = restaurant.querySelector('.resultItem-address').innerHTML
      data.push(address)
    });
    return data
  })

  for (let i = 1; i <= 16; i++) {
    // 2 - Naviguer jusqu'à l'URL cible
    await page.goto('https://www.lafourchette.com/restaurant+1er-arrondissement+paris?page=' + i)
    // await page.click(
    //   '#default > div > div > div > div > section > div:nth-child(2) > ol > li:nth-child(1) > article > div.image_container > a > img',
    // )
    await page.waitFor(10000) // fait une pause d'une seconde
    test.push(result)
    console.log(result)
  }

  // 4 - Retourner les données (et fermer le navigateur)
  browser.close()
  return test
}



// Appelle la fonction getData() et affichage les données retournées
getData().then(value => {
  console.log(value)
})