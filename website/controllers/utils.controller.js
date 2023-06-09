// copy this edit function and amend the function name in utils.routes.js accordingly.
// to import a helper function (e.g. nlsr.js) do something like 
// const nlsr = require("../utils/nlsr.js");
const axios = require("axios")

// we trigger this function by sending a HTTP request to the endpoint http://{LAN IP ADDRESS}/api/utils/light_led
exports.light_led = (req, res) => {
  // Validate request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty."
    });
    return;
  }

  // This then uses axios to send a request to the API endpoint hosted by the Raspberry Pi
  const url = "http://192.168.25.157" // API URL endpoint of Pi (192.68.34.157 is Pi Static IP)
  
  axios.post(url, "light_on") // send a POST request to that URL, with 'light_on' as the payload (change this to 'light_off' for turning off LED)
  .then((response) => console.log(response))
  .catch((error) => console.log(error));
    
  // Log something
  console.log('Sent a request to Pi 1');

  // Respond with something
  res.send('State updated successfully!');

};