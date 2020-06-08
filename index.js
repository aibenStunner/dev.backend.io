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
const parentAuth = require('./src/auth/parent/parent_auth')
const GodseyeSTREAM = require('./src/api/feed')
const getUserCamera = require('./src/api/user_cameras')
const hubAuth = require('./src/auth/hub/hub_auth')

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

app.use('/', express.static('public'))

// GET HANDLERS
// PARENT STREAMER
app.get('/parents/feed/:cameraId', (req, res, next) => {
	if (!req.session.user) {
		res.json({ failure: { reason: 'please login first' } })
	} else {
		if (req.params.cameraId) {
			let selectedCamera = req.session.user.cameraData.filter(
				(obj) => obj.cameraId == req.params.cameraId
			)[0]
			selectedCamera
				? GodseyeSTREAM(selectedCamera.camera_link, res)
				: res.json({
						failure: { reason: 'access denied to this resource' },
				  })
		}
	}
})

// POST HANDLERS
// PARENT AUTHENTICATION ENDPOINTS
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

				return loginStatus
			})
			.then((loginStatus1) => {
				let loginStatus = loginStatus1
				getUserCamera(req.session.user.parentId)
					.then((cameraData) => {
						loginStatus.user.cameraData = cameraData
						return loginStatus
					})

					.then((loginStatus2) => {
						req.session.user = loginStatus2.user
						res.json(loginStatus2)
					})
			})
			.catch((err) => {
				res.json(err)
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
		.catch((err) =>
			res.json({
				status: { failure: err },
			})
		)
})

// CAMERA SERVER REGISTRATION ENDPOINTS : ALL OPS ARE ADMIN AUTHENTICATED BEFORE EXECUTION
// UPDATE CAMERA_LINK
app.post('/hubs/update', (req, res, next) => {
	let cameraObj = {
		camera_name: req.body.camera_name,
		camera_link: req.body.camera_link,
		camera_password: req.body.camera_password,
	}

	hubAuth
		.updateCamera(cameraObj)
		.then((success) => {
			res.json(success)
		})
		.catch((failure) => {
			res.json(failure)
		})
})

// REGISTER CAMERA
app.post('/hubs/register', (req, res, next) => {
	let cameraObj = {
		camera_name: req.body.camera_name,
		camera_link: req.body.camera_link,
		camera_password: req.body.camera_password,
	}

	hubAuth
		.registerCamera(cameraObj)
		.then((success) => {
			res.json(success)
		})
		.catch((failure) => {
			res.json(failure)
		})
})

// DELETE CAMERA
app.post('/hubs/delete', (req, res, next) => {
	let cameraObj = {
		camera_name: req.body.camera_name,
		camera_link: req.body.camera_link,
		camera_password: req.body.camera_password,
	}

	hubAuth
		.deleteCamera(cameraObj)
		.then((success) => {
			res.json(success)
		})
		.catch((failure) => {
			res.json(failure)
		})
})

// REGISTER NEW CAMERA

// ALL OTHER POST REQUESTS
app.post('/*', (req, res, next) => {
	res.sendStatus(404)
})

// BEGIN LISTENING
app.listen(port, console.log(`Godseye Server live on port ${port}`))
