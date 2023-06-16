//Require the dev-dependencies
let chai = require('chai');
let chaiHttp = require('chai-http');
let server = require('../app');
let should = chai.should();
let db = require("../models");
const e = require('express');

chai.use(chaiHttp);



// console.log("asdasdasdasd")
// //console.log(Object.keys(db.live_database))
// db.sequelize.sync().then(() => { 
//   db.live_database.findAll().then((data)=> {
//     console.log("asdadasjhbdashidhiuasdhiuashiud"); 
//     console.log(data);
//   }
//   )
// });




/// TESTING THE ROUTING


describe('root', () => {

  describe('/GET root', () => {
    it('it should GET all the books', (done) => {




      chai.request(server)
        .get('/')
        .end((err, res) => {
          res.should.have.status(200);
          done();
        });
    });
  });

});


//write a unit test for `/api/all_info/dump` 
// this api copies everything from Live_database.findAll() to All_info
// so to test it we get Live_database.findAll() before calling the API, then check the Allinfo afterwards


// this is not finished as i dont know how to do

describe('/GET /api/all_info/dump', () => {
  it('check if everythingfrom live database is copied to allinfo', (done) => {

    db.sequelize.sync().then(() => {
      db.live_database.findAll().then((before) => {

        console.log("before")

        chai.request(server)
          .get('/api/all_info/dump')
          .end((err, res) => {

            db.all_info.findAll().then((after) => {
              console.log("after")
              console.log(after)
              //compare before and after as objects
              if (JSON.stringify(before) === JSON.stringify(after)) {
                done();
              } else {
                throw err;
              }
            })

          }
          );

      });
    }
    )

  });

});









// `/api/live_database/latest`

// this api finds the latest entry from live_database and return
// test: get the latest entry before calling API and compare it afterwards

describe('/GET /api/live_database/latest', () => {
  it('should get the latest entry', (done) => {
    db.sequelize.sync().then(() => {
      db.live_database.findOne({
        order: [["createdAt", "DESC"]],
      }).then((before) => {

        console.log("before")
        console.log(before)

        chai.request(server)
          .get('/api/live_database/latest')
          .end((err, res) => {

            console.log("res")
            console.log(res.body)

            if (JSON.stringify(before) === JSON.stringify(res.body)) {
              done();
            } else {
              throw err;
            }
          });
      }).catch((err) => {
        console.log(err.message || "Error retrieving latest live db tile");
      });
    });
  });
}); 

