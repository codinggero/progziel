const bcrypt = require("bcrypt");
const Model = require("../models");
const Module = require("../modules");

module.exports.signup = async (req, res) => {
  try {
    const { email, password, username } = req.body;
    const exsits = await Model.Users.findOne({ email: email }).exec();
    if (exsits) {
      res.status(409).json({ message: "User Email Already Exists!" });
    } else {
      const user = new Model.Users({
        email: email,
        username: username,
        password: password,
      });
      const docs = await user.save();
      res
        .status(201)
        .json({ message: "User registered successfully", data: docs });
    }
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

module.exports.signin = async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await Model.Users.findOne({ email });
    if (!user) {
      return res.status(401).json({ message: "Invalid credentials" });
    }

    const validPassword = await bcrypt.compare(password, user.password);

    if (!validPassword) {
      return res.status(401).json({ message: "Invalid credentials" });
    }

    console.log(user);

    const token = Module.Jwt.generate({
      id: user._id,
      email: user.email,
      username: user.username,
      status: user.status,
    });

    res.status(200).json({ message: "User Login", data: { token } });
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

module.exports.getProfile = async (req, res) => {
  try {
    const { id } = req.user;
    const user = await Model.Users.findById(id);
    if (!user) {
      return res.status(401).json({ message: "Invalid credentials" });
    }
    res.status(200).json({ message: "User Profile", data: user });
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

module.exports.UpdateProfile = async (req, res) => {
  try {
    var update = {};
    const { id } = req.user;
    const { email, old_password, new_password, username, bio } = req.body;
    const options = { returnDocument: "after" };

    if (email != undefined) {
      update = { email: email };
    }

    if (old_password != undefined && new_password != undefined) {
      const user = await Model.Users.findById(id);
      const validPassword = await bcrypt.compare(old_password, user.password);

      if (!validPassword) {
        return res.status(401).json({ message: "Invalid credentials" });
      } else {
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(new_password, salt);
        update = { password: hashedPassword };
      }
    }

    if (username != undefined) {
      update = { username: username };
    }

    if (bio != undefined) {
      update = { bio: bio };
    }
    console.log({ update });

    const user = await Model.Users.findByIdAndUpdate(id, update, options);
    if (!user) {
      return res.status(401).json({ message: "Invalid credentials" });
    }
    return res.status(200).json({ message: "User Profile", data: user });
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};
