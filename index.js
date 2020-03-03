const express = require("express");
const app = express();
const port = 4000;
const bodyParser = require("body-parser");
const cors = require("cors");
const SimpleCrypto = require("simple-crypto-js").default;
const cameras = require("./store").cameras;

//Setting up middlewares
app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

//Returns dynamic secret for encryption based on current date
function getSecret() {
  return new Date().getDate().toString();
}

//Return encrypted link
function encryptLink(camera_name) {
  let encryptor = new SimpleCrypto(getSecret());
  return encryptor.encrypt(cameras[camera_name]);
}

// This function decrypts the encrypted link. Only for testing purposes
// function decryptLink(secret, crypt) {
//   let decryptor = new SimpleCrypto(secret);
//   return decryptor.decrypt(crypt);
// }

//GET Handlers
app.get("/stream", (req, res) => {
  res.json(encryptLink("cam_1") + getSecret());
});

// WARNING: Do not uncomment in production!
// app.get("/decrypt", (req, res) => {
//   res.send(decryptLink(req.query.date, req.query.auth));
// });

//POST Handlers
app.post("/feed", (req, res) => {
  console.log(req.body);
  res.json("Received");
});

//Listener
app.listen(port, () => {
  console.log(`dev.io - Godseye running on port ${port}`);
});
