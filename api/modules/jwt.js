// Define a secret key for JWT
const jwt = require("jsonwebtoken");
const secretKey = "secret";

// Generate JWT token
module.exports.generate = (user, expiresIn = "1d") => {
  return jwt.sign(user, secretKey);
};

module.exports.verify = (token, callback) => {
  jwt.verify(token, secretKey, callback);
};
