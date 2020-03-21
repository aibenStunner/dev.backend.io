//  Dependencies
const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const cors = require('cors');
const getHandler = require('./getHandlers');
const postHandler = require('./postHandlers');

//  Setting up middlewares
app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

//Listener
app.listen(4000, () => {
  console.log(`Live! on 4000`);
});

// POST Handlers
app.post('/login', (req, res) => postHandler.login(req, res));
app.post('/feed', (req, res) => postHandler.feed(req, res, true));

//GET Handler
app.get('/*', (req, res) => getHandler.get_404(res));