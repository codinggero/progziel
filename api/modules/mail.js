const nodemailer = require("nodemailer");
const mail = "codinggero@gmail.com";
const pass = "JunaidShaukat@151295#";

const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: mail,
    pass: pass,
  },
});

module.exports.Send = async function ({ to = "", subject = "", text = "" }) {
  var mailOptions = {
    from: mail,
    to: to,
    subject: subject,
    text: text,
  };
  transporter.sendMail(mailOptions, function (error, info) {
    if (error) {
      console.log(error);
    } else {
      console.log("Email sent: " + info.response);
    }
  });
};
