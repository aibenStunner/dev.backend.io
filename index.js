const express = require("express");
const app = express();
const fs = require("fs");
const fetch = require("node-fetch");
const http = require("http");
const port = 2000;

app.get("/", (req, res) => {
  
});

app.listen(port, () => console.log(` listening on port ${port}!`));
