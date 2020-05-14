const express = require('express')
const app = express()
const cors = require('cors')
const session = require('express-session')
const bodyParser = require('body-parser')
const MySQLStore = require('express-mysql-session')(session)

//Server Meta
const DBMeta = require('./src/auth/db_cred.js')

//Functions
const authenticateUser = require('./src/auth/login.js')
const piper = require('./src/pipe/pied-piper.js')
const getUserCamera = require('./src/camera_ops/getUserCameras.js')

// Immutables
const port = process.env.PORT || 5000
const sessionStore = new MySQLStore(DBMeta.godseyeDB)

// Middleware
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

// GET Handler
app.get('/feed/:cameraId', (req, res, next) => {
	if (!req.session.userId) {
		res.json({ status: 'failure: please login first' })
	} else {
		let selectedCamera = req.session.cameras.filter((obj) =>
			obj.id == req.params.cameraId ? obj : ''
		)
		selectedCamera[0]
			? piper.getFeed(selectedCamera[0].link, res)
			: res.json({ status: 'failure: access denied to this resource' })
	}
})

app.get('/*', (req, res) =>
	res.sendFile('/views/index.html', { root: __dirname }, (err) => {
		if (err) console.error(err)
	})
)

// POST Handlers
app.post('/cameras', (req, res, next) => {
	if (!req.session.userId) {
		res.json({ status: 'failure: please login first' })
	} else {
		let userCameraObject = []
		req.session.cameras.forEach((obj) =>
			userCameraObject.push({ id: obj.id })
		)
		res.json(userCameraObject)
	}
})

app.post('/login', (req, res, next) => {
	if (req.session.userId) {
		res.json({ status: 'logged in already' })
	} else {
		authenticateUser(req.body.email, req.body.password, (record) => {
			if (record) {
				req.session.userId = record.parentId
				req.session.username = record.username
				req.session.cameras = getUserCamera(record.parentId)
				// [
				// { id: 'mumsphone', link: 'http://192.168.43.1:8080/video' },
				// {
				// 	id: 'golfcam',
				// 	link: 'http://wmccpinetop.axiscam.net/mjpg/video.mjpg',
				// },
				// ]

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
		res.json({ status: 'success: Session ended' })
	} else {
		res.json({ status: 'failure: No active session found' })
	}
})

app.listen(port, console.log(`Godseye Server live on port ${port}`))
