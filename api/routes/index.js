// routes/authRoutes.js
const express = require("express");
const router = express.Router();
const Controller = require("../controllers/index");
const Middleware = require("../middlewares/index");

// Register a new user
router.post("/signup", Middleware.Validate.signup, Controller.Users.signup);
// Signin
router.post("/signin", Middleware.Validate.signin, Controller.Users.signin);
// Protected route (Get User Profile)
router.get("/profile", Middleware.Auth.token, Controller.Users.getProfile);
// Protected route (Update User Profile)
router.post("/profile", Middleware.Auth.token, Controller.Users.UpdateProfile);
// Protected route (example)
router.get("/posts", Middleware.Auth.token, Controller.Posts.get);
// Protected route (example)
router.post("/posts", Middleware.Auth.token, Controller.Posts.post);
// Protected route (example)
router.post("/posts/update", Middleware.Auth.token, Controller.Posts.update);
// Protected route (example)
router.post("/posts/delete", Middleware.Auth.token, Controller.Posts.delete);

module.exports = router;
