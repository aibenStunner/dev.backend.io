const DBMeta = require('./src/db_cred.js')
const express = require('express')
const app = express()
const session = require('express-session')
const MySQLStore = require('express-mysql-session')(session)

//Server Meta

// Immutables
const port = process.env.PORT || 5000
const sessionStore = new MySQLStore(DBMeta.godseyeDB)

// Middleware
app.use(
	session({
		secret: 'coded-keys',
		resave: 'false',
		store: sessionStore,
		saveUninitialized: 'false',
	})
)

// GET Handler
app.get('/*', (req, res) =>
	res.sendFile('/views/index.html', { root: __dirname }, (err) => {
		if (err) console.error(err)
	})
)

// POST Handlers
app.post('/login', (req, res, next) => {
	if (req.session.user) {
		res.send('Already logged in')
	} else {
		res.send('Logged In')
	}
})

app.post('/logout', (req, res, next) => {})

app.post('/feed', (req, res) => {})

app.listen(port, console.log(`Godseye Server live on port ${port}`))
