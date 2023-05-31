const express = require('express')
const bodyParser = require('body-parser')
 
const app = express()
 
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))
 
app.get('/', (req, res) => {
    console.log("received get")
  res.send('Hello World!')
})
 
app.post('/', (req, res) => {
    let data = req.body;
    console.log("received POST")
    console.log(data)
    res.send('Data Received: ' + JSON.stringify(data));
})
 
 
app.listen(3000, () => {
  console.log('Example app listening on port 3000!')
})