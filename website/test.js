const assert = require('assert');
const { exec } = require('child_process');


// is this a dumb test lol
describe('Server Build', function() {
  this.timeout(10000);
  it('should build the server successfully', function(done) {
    exec('node server.js', function(error, stdout, stderr) {
      assert.strictEqual(error, null, 'Error occurred while building the server');
      done();
    });
  });
});
