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

//POST Handlers
app.post('/login', (req, res) => postHandler.login(req, res));

app.post('/feed', (req, res) => postHandler.feed(req, res));

//GET Handler
app.get('/*', (req, res) => getHandler.get_404(res));

//Listener
app.listen(4000, () => {
  console.log('Live!');
});
