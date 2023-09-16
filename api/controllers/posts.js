const bcrypt = require("bcrypt");
const Model = require("../models");
const Module = require("../modules");

module.exports.get = async (req, res) => {
  try {
    const docs = await Model.Posts.find({}).exec();
    res.status(200).json({ message: "Post Found", data: docs });
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

module.exports.post = async (req, res) => {
  try {
    const { id } = req.user;
    const { title, content } = req.body;
    const post = new Model.Posts({
      title: title,
      content: content,
      author: id,
    });
    const docs = await post.save();
    res.status(201).json({ message: "post create successfully", data: docs });
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

module.exports.update = async (req, res) => {
  try {
    const author = req.user;
    const { id, title, content } = req.body;

    const options = { returnDocument: "after" };
    const update = {
      title: title,
      content: content,
      author: author.id,
    };
    const docs = await Model.Posts.findByIdAndUpdate(id, update, options);
    res.status(200).json({ message: "Update Post", data: docs });
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

module.exports.delete = async (req, res) => {
  try {
    const { id } = req.body;
    const docs = await Model.Posts.findByIdAndDelete(id);
    return res.status(200).json({ message: "Delete Post", data: docs });
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};
