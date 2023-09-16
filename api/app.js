// app.js
const express = require("express");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const app = express();
const port = process.env.PORT || 8000;

// Connect to MongoDB (make sure MongoDB is running)
mongoose
  .connect("mongodb://0.0.0.0:27017/db", {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then((reason) => {
    console.log("connected");
  })
  .catch((err) => {
    console.log(err);
  });

// Middleware for parsing JSON data
app.use(bodyParser.json());

// Routes
const routes = require("./routes/index");

app.use("/api", routes);

// Start the server
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
