// DEPRECATED

// const axios = require('axios'); 

exports.edit = (req, res) => {
    // Validate request
    if (!req.body.newMap) {
      res.status(400).send({
        message: "Content can not be empty."
      });
      return;
    }
    
    const { newMap } = req.body;
    let updatedTileInfo = newMap[0];
    let newGlobalX = newMap[1][0];
    let newGlobalY = newMap[1][1];

    globalMap[newGlobalX][newGlobalY] = updatedTileInfo;
 
    // Log the updated array
    console.log('Updated Array:', globalMap);
    
    // so this won't work because of the asynchronous nature of React polling - this is sending a POST request
    // at a time at which the endpoint is not operating (it opens every 3 seconds)
    // the resolution is therefore to open the endpoint and poll the database asynchronously instead
    // of chaining the API endpoints - this makes more sense from a separation of responsibilities
    // principle as well

/*     // Send the secondary API request
    axios.post('http://127.0.0.1:3000/matrix')
    .then(response => {
    // Handle the response from the secondary API request
    response.data = globalMap;
    // Send the response back to the original request
       res.json({ data: response.data });
    })
    .catch(error => {
    // Handle errors from the secondary API request
      console.error('Secondary API request error:', error);
      // res.status(500).json({ error: 'Internal server error' });
    });
     */
    res.send('Array updated successfully!');

  };