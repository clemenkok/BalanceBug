const express = require('express')
const app = express()
const port = 8000


let griddimension = 2;
let grid = Array(griddimension).fill(Array(griddimension).fill([1, 1, 1, 1, 0]));

//console.log(grid)


app.get('/', (req, res) => {
  res.send('Hello World!')
})
app.get('/myfkingtest', (req, res) => {



    res.send('Hello World!')
})

app.get('/currenttile', (req, res) => {

    let nexttile = getnexttile()

    res.send(nexttile)
})


app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})

let currentitle = [0,0]
function getnexttile(){
    if(currentitle[1] < griddimension - 1){
        currentitle[1] += 1;
    }else if ()
        currentitle[0] += 1
        currentitle[1] = 0;
    }
    console.log(currentitle)
    return currentitle;
}  