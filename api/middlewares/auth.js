// middlewares/authMiddleware.js

const Module = require("../modules");
module.exports.token = (req, res, next) => {
  const authorization = req.header("Authorization");
  const token = authorization && authorization.split(" ")[1];
  console.log(authorization);

  if (!token) {
    return res.status(401).json({ message: "Access denied" });
  }

  Module.Jwt.verify(token, (err, user) => {
    if (err) {
      return res.status(403).json({ message: "Invalid token" });
    }
    req.user = user;
    next();
  });
};
