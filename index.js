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
		res.json({ status: 'logged in already' })
	} else {
		authenticateUser(req.body.email, req.body.password, (record) => {
			if (record) {
				req.session.userId = record.parentId
				req.session.username = record.username
				res.json({ status: 'login attempt successful' })
			} else {
				res.json({ status: 'login attempt failed' })
			}
		})
	}
})

app.post('/logout', (req, res, next) => {
	if (req.session.userId) {
		req.session.destroy((err) => {
			if (err) throw err
		})
		res.json({ status: 'Success: Session' })
	} else {
		res.json({ status: 'Failure: No active session found' })
	}
})

app.post('/feed', (req, res) => {})

app.listen(port, console.log(`Godseye Server live on port ${port}`))
