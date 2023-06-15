
// set port, listen for requests
const PORT = process.env.PORT || 8080;


require('./app.js').listen(PORT, () => {
    console.log(`Server is running on port ${PORT}.`);
  });
  