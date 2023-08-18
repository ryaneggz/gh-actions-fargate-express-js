// Importing express module
const express = require('express') 
const app = express() 

// Respond with "hello world" for requests that hit our root "/"
app.get('/', function (req, res) { 
  res.send('Hello World') 
}) 

// listen to port 3000 by default
const server = app.listen(process.env.PORT || 3000, () => { 
  console.log("Server is running on port 3000"); 
}); 

module.exports = server;