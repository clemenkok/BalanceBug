//Require the dev-dependencies
let chai = require('chai');
let chaiHttp = require('chai-http');
let server = require('../app');
let should = chai.should();
let db = require("../models");
const e = require('express');

chai.use(chaiHttp);

const fs = require('fs');
const path = require('path');



//currently it checks for object equality, but it should check for check for routingalgo(input) == answer


describe('maze algo test', () => {


    

    fs.readdir('./test/maze/input', (err, files) => {
      if (err) {
        console.error('Error reading directory:', err);
        return;
      }
    
      files.forEach((file) => {
        let input = fs.readFileSync(path.join('./test/maze/input', file))
        let answer = fs.readFileSync(path.join('./test/maze/answer', file))

        //apply the routing algo here


        it('input should match the answer', (done) => {
  
            if(object_equals(input, answer)){
                done();
            }
            else{
                throw new Error("input does not match answer");
            }
  

        });
    


      });

    });


});






// compare objects

function object_equals( x, y ) {
    if ( x === y ) return true;
      // if both x and y are null or undefined and exactly the same
  
    if ( ! ( x instanceof Object ) || ! ( y instanceof Object ) ) return false;
      // if they are not strictly equal, they both need to be Objects
  
    if ( x.constructor !== y.constructor ) return false;
      // they must have the exact same prototype chain, the closest we can do is
      // test there constructor.
  
    for ( var p in x ) {
      if ( ! x.hasOwnProperty( p ) ) continue;
        // other properties were tested using x.constructor === y.constructor
  
      if ( ! y.hasOwnProperty( p ) ) return false;
        // allows to compare x[ p ] and y[ p ] when set to undefined
  
      if ( x[ p ] === y[ p ] ) continue;
        // if they have the same strict value or identity then they are equal
  
      if ( typeof( x[ p ] ) !== "object" ) return false;
        // Numbers, Strings, Functions, Booleans must be strictly equal
  
      if ( ! object_equals( x[ p ],  y[ p ] ) ) return false;
        // Objects and Arrays must be tested recursively
    }
  
    for ( p in y )
      if ( y.hasOwnProperty( p ) && ! x.hasOwnProperty( p ) )
        return false;
          // allows x[ p ] to be set to undefined
  
    return true;
  }