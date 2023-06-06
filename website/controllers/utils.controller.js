// copy this edit function and amend the function name in utils.routes.js accordingly.
// to import a helper function (e.g. nlsr.js) do something like 
// const nlsr = require("../utils/nlsr.js");

exports.edit = (req, res) => {
  // Validate request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty."
    });
    return;
  }

  // Do something

  // Log something
  console.log('insert debug statements here');

  // Respond with something
  res.send('Array updated successfully!');

};