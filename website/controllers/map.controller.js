exports.edit = (req, res) => {
    // Validate request
    if (!req.body.newMap) {
      res.status(400).send({
        message: "Content can not be empty."
      });
      return;
    }
    
    const { newMap } = req.body;
  
    globalMap = newMap;

    // Log the updated array
    console.log('Updated Array:', globalMap);

    res.send('Array updated successfully!');

  };