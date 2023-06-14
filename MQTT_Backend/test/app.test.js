//Require the dev-dependencies
let chai = require('chai');
let chaiHttp = require('chai-http');
let server = require('../app');
let should = chai.should();

chai.use(chaiHttp);


describe('root', () => {

/*
  * Test the /GET route
  */
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




// // Root

// request(app)
//   .get('/')
//   .end(function(err, res) {
//         if (err) throw err;
//         console.log(res.body);
//   });


// // All info routes  (/api/all_info)

// request(app)
//   .get('/api/all_info/dump')
//   .end(function(err, res) {
//         if (err) throw err;
//         console.log(res.body);
//   });




// //live database routes  (/api/live_database)



// request(app)
//   .get('/api/live_database/latest')
//   .end(function(err, res) {
//         if (err) throw err;
//         console.log(res.body);
//   });



// request(app)
// .get('/api/live_database/add')
// .end(function(err, res) {
//       if (err) throw err;
//       console.log(res.body);
// });



// // map info routes



// request(app)
//   .get('/api/map_info')
//   .end(function(err, res) {
//         if (err) throw err;
//         console.log(res.body);
//   });

