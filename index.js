const express = require('express')
const app = express()
const session = require('express-session')
const bodyParser = require('body-parser')
const MySQLStore = require('express-mysql-session')(session)

//Server Meta
const DBMeta = require('./src/db_cred.js')

//Functions
const authenticateUser = require('./src/login')

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

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))

// GET Handler
app.get('/*', (req, res) =>
	res.sendFile('/views/index.html', { root: __dirname }, (err) => {
		if (err) console.error(err)
	})
)

// POST Handlers
app.post('/login', (req, res, next) => {
	if (req.session.userId) {
		res.send('Already logged in')
	} else {
		let user
		authenticateUser(req.body.username, req.body.password, (record) => {
			if (record) {
				req.session.userId = record.parentId
				req.session.username = record.username
				res.send('Logged In')
			} else {
				res.send('Login failed. Check credentials')
			}
		})
	}
})

app.post('/logout', (req, res, next) => {})

app.post('/feed', (req, res) => {})

app.listen(port, console.log(`Godseye Server live on port ${port}`))
