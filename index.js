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
app.post('/login', (req, res) => res.send(postHandler.login()));
app.get('/feed', (req, res) => res.send(postHandler.feed(req.query, true)));

//GET Handler
app.get('/*', (req, res) => res.status(404).sendFile(getHandler.get_404(res)));
