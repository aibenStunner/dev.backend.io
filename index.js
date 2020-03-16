const express = require("express");
const app = express();
const port = 4000;
const bodyParser = require("body-parser");
const path = require("path");
const cors = require("cors");
const SimpleCrypto = require("simple-crypto-js").default;
const bcrypt = require("bcrypt");
const saltRounds = 10;
const cameras = require("./cameras").cameras;

//Setting up middlewares
app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

//Returns dynamic secret for encryption based on current date
function getSecret() {
  return new Date().getDate().toString();
}


//Return encrypted link
function encryptCameraLink(camera_id) {
  let encryptor = new SimpleCrypto(getSecret());
  return encryptor.encrypt(cameras[camera_id]);
}

//Return object containing camera id and encrypted source
function getStreamObject(camera_id) {
  return {
    c: camera_id,
    s: encryptCameraLink(camera_id)
  };
}

//POST Handlers
app.post("/login", (req, res) => {
  
});

//Handler for stream object request
app.post("/feed", (req, res) => {
  res.json(getStreamObject(req.body.camera_id));
});

//GET Handler
app.get("/*", (req, res) => {
  res.sendFile(path.join(__dirname + "/public/404.html"));
});

//Listener
app.listen(port, () => {
  console.log(`dev.io - Godseye running on port ${port}`);
});
