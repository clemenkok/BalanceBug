var io = null;

var fs = require('fs');
const { runInContext } = require('vm');

var file = './html/newmapping/mapdata/data21jun1819.txt';
var data = fs.readFileSync(file, 'utf8');
var dataArr = data.toString().split('\n');
//remove last dataarr
dataArr.pop();
//each dataarr is a line of data like 1,1,1,1,1 so we need to split it by commas but only keep first 3
var dataArr2 = [];
for (var i = 0; i < dataArr.length; i++) {
  let temp = dataArr[i].split(',');
  //remove last 2 element of temp
  temp.pop();
  temp.pop();
  //each element of temp convert into number
  for (var j = 0; j < temp.length; j++) {
    temp[j] = Number(temp[j]);
  }
  dataArr2.push(temp);
}
var currentcount1 = 0;

//create an array from range 1 to 12 for testing
var a = [];
for (var i = 1; i <= 12; i++) {
  let temp = [];
  temp.push(i);
  temp.push(i);
  a.push(temp);
}
//console.log(a);
//dataArr2 = a;

var selectevery = 5; //********
var blurredarray = [];
for (var i = 0; i < Math.ceil(dataArr2.length / selectevery); i++) {
  let tempx = 0;
  let tempy = 0;

  if (i + 1 < Math.ceil(dataArr2.length / selectevery)) {
    for (var j = 0; j < selectevery; j++) {
      if (selectevery * i + j < dataArr2.length)
        tempx += dataArr2[selectevery * i + j][0];
    }
    tempx = tempx / selectevery;

    for (var j = 0; j < selectevery; j++) {
      if (selectevery * i + j < dataArr2.length)
        tempy += dataArr2[selectevery * i + j][1];
    }
    tempy = tempy / selectevery;
  }

  if (!(i + 1 < Math.ceil(dataArr2.length / selectevery))) {
    for (var j = 0; j < dataArr2.length - selectevery * i; j++) {
      tempx += dataArr2[selectevery * i + j][0];
    }
    tempx = tempx / (dataArr2.length - selectevery * i);

    for (var j = 0; j < dataArr2.length - selectevery * i; j++) {
      tempy += dataArr2[selectevery * i + j][1];
    }
    tempy = tempy / (dataArr2.length - selectevery * i);
  }

  //console.log(tempx, tempy);

  blurredarray.push([tempx, tempy]);
}
var currentcount2 = 0;
//console.log(blurredarray);

//using my fake data ****
var fakefile = './html/newmapping/mapdata/fakedata1.txt';
var fakedata = fs.readFileSync(fakefile, 'utf8');
var _fakedataArr = fakedata.toString().split('\n');
var fakedataArr = [];
for (var i = 0; i < _fakedataArr.length; i++) {
  let temp = _fakedataArr[i].split(',');
  //each element of temp convert into number
  for (var j = 0; j < temp.length; j++) {
    temp[j] = Number(temp[j]);
  }
  fakedataArr.push(temp);
}
var fakecurrentcount = 0;

module.exports.setupsocket = function (http) {
  io = require('socket.io')(http);

  io.on('connection', (socket) => {
    console.log(`Socket ${socket.id} connected.`);

    socket.on('needball', (msg) => {
      if (currentcount1 < dataArr2.length) {
        let tmp = [
          dataArr2[currentcount1][0],
          dataArr2[currentcount1][1],
          'right',
        ];
        //console.log(tmp)
        io.emit('sendyouball', tmp);
        currentcount1++;
      }
    });

    socket.on('needbigball', (msg) => {
      if (currentcount2 < blurredarray.length) {
        let tmp = [
          blurredarray[currentcount2][0],
          blurredarray[currentcount2][1],
          'right',
        ];
        io.emit('sendyouball', tmp);
        currentcount2++;
      }
    });

    socket.on('resetcount', (msg) => {
      console.log('reset count');
      currentcount1 = currentcount2 = fakecurrentcount = 0;
    });

    socket.on('getfakedata', (msg) => {
      if (fakecurrentcount < fakedataArr.length) {
        let tmp = [
          fakedataArr[fakecurrentcount][0],
          fakedataArr[currfakecurrentcountentcount2][1],
          'left',
        ];
        io.emit('sendyouball', tmp);
        fakecurrentcount++;
      }
    });
  });

  return io;
};

module.exports.socketemit = function (eventname, data) {
  io.emit(eventname, data);
};
