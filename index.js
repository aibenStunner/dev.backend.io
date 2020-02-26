const express = require("express");
const app = express();
const port = 2000;

app.get("/", (req, res) => res.send("God's eye backend test!"));

app.listen(port, () => console.log(` listening on port ${port}!`));
