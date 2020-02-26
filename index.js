const express = require("express");
const app = express();
const port = 2000;

const fs = require("fs");
const fetch = require("node-fetch");

fetch(
  "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png"
).then(res => {
  const dest = fs.createWriteStream("./public/pic.jpg");
  res.body.pipe(dest);
  console.log("Saved!");
});

app.use(express.static("public"));

app.get("/", (req, res) => res.send(`<img src='pic.jpg'/>`));

app.listen(port, () => console.log(` listening on port ${port}!`));
