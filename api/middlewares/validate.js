// middlewares/validateMiddleware.js
const { validationResult } = require("express-validator");
const { check } = require("express-validator");

function validate(req, res, next) {
  console.log({
    query: req.query,
    body: req.body,
  });
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }
  next();
}

module.exports.signup = [
  check("username").notEmpty(),
  check("email").notEmpty(),
  check("password").isLength({ min: 6 }),
  validate,
];

module.exports.signin = [
  check("email").notEmpty(),
  check("password").isLength({ min: 6 }),
  validate,
];

module.exports.signin = [
  check("email").notEmpty(),
  check("password").isLength({ min: 6 }),
  validate,
];
