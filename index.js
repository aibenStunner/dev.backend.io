// IMPORTS
const express = require('express')
const app = express()
const cors = require('cors')
const session = require('express-session')
const bodyParser = require('body-parser')
const MySQLStore = require('express-mysql-session')(session)

// SERVER METADATA
const DBMeta = require('./src/db/credentials.json')

// IMPORTED FUNCTIONS
// const authenticateUser = require('./src/auth/login.js')
const parentAuth = require('./src/auth/parent_auth')
// const piper = require('./src/pipe/pied-piper.js')
// const getUserCamera = require('./src/camera_ops/getUserCameras.js')

// Immutables
const port = process.env.PORT || 5000
const sessionStore = new MySQLStore(DBMeta.RDS)

// MIDDLEWARE
app.use(
	cors({
		credentials: true,
		origin: true,
	})
)
app.use(
	session({
		secret: 'coded-keys',
		resave: 'false',
		store: sessionStore,
		saveUninitialized: 'false',
		name: 'godseye.lash',
		cookie: {
			SameSite: 'lax',
		},
	})
)

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))

// GET HANDLERS
app.get('/feed/:cameraId', (req, res, next) => {
	if (!req.session.userId) {
		res.json({ failure: { reason: 'please login first' } })
	} else {
		let selectedCamera = req.session.cameras.filter((obj) =>
			obj.id == req.params.cameraId ? obj : ''
		)
		selectedCamera[0]
			? piper.getFeed(selectedCamera[0].link, res)
			: res.json({
					failure: { reason: 'access denied to this resource' },
			  })
	}
})

app.get('/*', (req, res) =>
	res.sendFile('/public/index.html', { root: __dirname }, (err) => {
		if (err) console.error(err)
	})
)

// POST HANDLERS

// USER DATA ENDPOINTS
app.post('/cameras', (req, res, next) => {
	if (!req.session.userId) {
		res.json({ status: { failure: 'access denied to this resource' } })
	} else {
		let userCameraObject = []
		req.session.cameras.forEach((obj) =>
			userCameraObject.push({ id: obj.id })
		)
		res.json(userCameraObject)
	}
})

// AUTHENTICATION ENDPOINTS

app.post('/parents/login', (req, res, next) => {
	if (req.session.user) {
		if (req.session.user.parentId) {
			res.json({ status: { illegal: 'Parent logged in already' } })
		}
	} else {
		parentAuth
			.login(req.body.email, req.body.password)
			.then((loginStatus) => {
				// SESSION BEGIN
				if (loginStatus.status.success) {
					delete loginStatus.user.password
					req.session.user = loginStatus.user
				}
				res.json(loginStatus)
			})
			.catch((err) => {
				if (err.failure) {
					res.json(err)
				} else {
					console.log(err)
					res.json({
						status: {
							failure: 'An internal server error occured.',
						},
					})
				}
			})
	}
})

app.post('/parents/logout', (req, res, next) => {
	if (req.session.user) {
		req.session.destroy((err) => {
			if (err) throw err
		})
		res.json({ status: { success: 'Session ended' } })
	} else {
		res.json({ status: { failure: 'No active session found' } })
	}
})

app.post('/parents/signup', (req, res, next) => {
	parentAuth
		.signup(
			req.body.firstName,
			req.body.lastName,
			req.body.password,
			req.body.nChildren,
			req.body.email
		)
		.then((result) => res.json(result))
		.catch((err) => res.json(err))
})

// OTHER POST REQUESTS
app.post('/*', (req, res, next) => {
	res.sendStatus(204)
})

app.listen(port, console.log(`Godseye Server live on port ${port}`))
