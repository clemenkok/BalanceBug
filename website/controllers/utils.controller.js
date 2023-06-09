// copy this edit function and amend the function name in utils.routes.js accordingly.
// to import a helper function (e.g. nlsr.js) do something like 
// const nlsr = require("../utils/nlsr.js");
const axios = require("axios")

exports.start_rover = (req, res) => {
  // Validate request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty."
    });
    return;
  }

  const url = "http://192.168.34.157/light/on"
  // Do something
  axios.post(url, "6")
  .then((response) => console.log(response))
  .catch((error) => console.log(error));
    
  // Log something
  console.log('insert debug statements here');

  // Respond with something
  res.send('Array updated successfully!');

};