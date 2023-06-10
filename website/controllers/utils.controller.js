// import axios to let us send requests over HTTP
const axios = require("axios")
const Deadreckoning_data = db.deadreckoning_data;

// API endpoint that listens for the user to start rover movement via the frontend
exports.start_rover = (req, res) => {
  // Validate request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty."
    });
    return;
  }

  // This then uses axios to send a request to the API endpoint hosted by the ESP32
  // TODO: Change IP address to static IP of ESP32
  const url = "http://192.168.25.157/start_rover" // URL endpoint of ESP32 (192.68.34.157 is ESP32 Static IP)
  
  axios.post(url, "start") // send a POST request to that URL, starting the rover
  .then((response) => console.log(response))
  .catch((error) => console.log(error));
    
  // Respond with something
  res.send('Rover has started successfully!');

};

// API endpoint that receives Deadreckoning data from the ESP32
/* The data will come in the following format:
{
  "distance_travelled": "2",
  "angle": "60"
}
*/

exports.deadreckoning_data = (req, res) => {
  // Validate request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty."
    });
    return;
  }

  // Loads deadreckoning data into database
  const deadreckoning_data = {
    distance_travelled: req.body.distance_travelled,
    angle: req.body.angle
  };

  Deadreckoning_data.create(deadreckoning_data)
  .then(data => {
    res.send("deadreckoning data successfully created:" + data);
  })
  .catch(err => {
    res.status(500).send({
      message:
        err.message || "Some error occurred while creating a row in the deadreckoning data table."
    });
  });

  // TODO: Build the map (@Yomna)

  // Respond with confirmation
  res.send('Data received successfully!');
  
};

// API endpoint that localises the rover (after turning of the corner)
// TODO: decide what data you want to save into the DB for beacon localisation (@Hubert)
exports.localise = (req, res) => {
  // Validate request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty."
    });
    return;
  }
  
  // URL endpoint of Pi (192.68.34.157 is Pi Static IP)
  const pi_1_url = "http://192.168.25.157" 
  const pi_2_url = "http://192.168.25.157"
  const pi_3_url = "http://192.168.25.157" 
  const pi_4_url = "http://192.168.25.157"

  // Beacon flags
  let arm_beacon = true
  let target_beacon = 1

  // TODO: Insert code that checks for capacitor energy status (@Jian Rong)
  let capacitor_energy_ready = true

  // This then uses axios to send a request to the IP Address of the Pi to turn on Beacons
  if (capacitor_energy_ready && arm_beacon) {
    switch (new target_beacon) {
      case 1:
        axios.post(pi_1_url, "light_on")
        .then((response) => console.log(response))
        .catch((error) => console.log(error));
        break
      case 2:
        axios.post(pi_1_url, "light_off") 
        .then((response) => console.log(response))
        .catch((error) => console.log(error));
        axios.post(pi_2_url, "light_on") 
        .then((response) => console.log(response))
        .catch((error) => console.log(error));
        break
      case 3:
        axios.post(pi_2_url, "light_off") 
        .then((response) => console.log(response))
        .catch((error) => console.log(error));
        axios.post(pi_3_url, "light_on") 
        .then((response) => console.log(response))
        .catch((error) => console.log(error));
        break
      case 4:
          axios.post(pi_3_url, "light_off") 
          .then((response) => console.log(response))
          .catch((error) => console.log(error));
        break
    }
    // re-arm after histogram completion
    arm_beacon = false
  }

  // TODO: Add to histogram and compute final distance from ball, adjusting target beacon once done
    
  // Respond with confirmation
  res.send('Height added to histogram successfully!');
  
};









