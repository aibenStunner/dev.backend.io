/**
 * @name GodseyeAPI
 * @author dev.io
 * @description This is the Node.js backend and REST API that handles all authentication,
 * 				information and streaming requests for the Godseye software
 * @copyright 2020 dev.io
 * @version 1.0.0
 *
 */

// IMPORTS
const express = require('express')
const app = express()
const cors = require('cors')
const session = require('express-session')
const bodyParser = require('body-parser')
const MySQLStore = require('express-mysql-session')(session)

// SERVER METADATA
const DBMeta = require('./src/db/credentials.json')

// ENVIRONMENT VARIABLES
const port = process.env.PORT || 5000

// AUTH OBJECTS
const hubAuth = require('./src/auth/hub/hub_auth')
const adminAuth = require('./src/auth/admin/admin_auth')
const parentAuth = require('./src/auth/parent/parent_auth new')

// API FUNCTIONS
const GodseyeSTREAM = require('./src/api/feed')
const getTeachers = require('./src/api/teachers')

// SESSION STORE
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
		GodseyeSTREAM(req.params.cameraId, req.session.user.parentId, res)
	}
})

// POST HANDLERS
// PARENT ENDPOINTS
app.post('/parents/login', (req, res, next) => {
	if (req.session.user) {
		res.json({
			status: { illegal: 'Parent logged in already' },
			user: req.session.user,
		})
	} else {
		parentAuth
			.login(req.body.email, req.body.password)
			.then((record) => {
				req.session.user = record.user
				res.json(record)
			})
			.catch((err) => res.json(err))
	}
})

app.post('/parents/logout', (req, res, next) => {
	res.json(parentAuth.logout(req))
})

app.post('/parents/info/teachers', (req, res, next) => {
	req.session.user
		? getTeachers()
				.then((results) =>
					res.json({
						status: { success: 'Fetched teachers successfully' },
						data: results,
					})
				)
				.catch((err) => res.json({ status: { failure: err } }))
		: res.json({ status: { failure: 'please login first' } })
})
/*
 ADMIN ONLY ENDPOINTS
 */

// Admin Login
app.post('/admin/login', (req, res, next) => {
	req.session.admin
		? res.json({ status: { illegal: 'Admin already logged in' } })
		: adminAuth.admins
				.adminLogin(req.body.email, req.body.password)
				.then((results) => {
					req.session.admin = true
					res.json({ status: { success: 'Admin logged in' } })
				})
				.catch((err) =>
					res.json({
						status: { failure: err },
					})
				)
})

// Admin Logout
app.post('/admin/logout', (req, res, next) => {
	res.json(adminAuth.admins.adminLogout(req))
})

// Admin Signup
app.post('/admin/signup', (req, res, next) => {
	!req.session.admin
		? res.json({ status: { failure: 'No active admin session found' } })
		: adminAuth.admins
				.addAdmin(
					req.body.firstName,
					req.body.lastName,
					req.body.password,
					req.body.email,
					req.body.phoneNumber
				)
				.then((results) => {
					res.json({ status: { success: 'Admin account added' } })
				})
				.catch((err) => res.json({ status: { failure: err } }))
})

app.post('/admin/update', (req, res, next) => {
	!req.session.admin
		? res.json({ status: { failure: 'No active admin session found' } })
		: adminAuth.admins
				.updateAdmin(
					req.body.firstName,
					req.body.lastName,
					req.body.email,
					req.body.phoneNumber
				)
				.then((results) => {
					res.json({ status: { success: 'Admin account updated' } })
				})
				.catch((err) => res.json({ status: { failure: err } }))
})

// Remove admin
app.post('/admin/remove', (req, res, next) => {
	!req.session.admin
		? res.json({ status: { failure: 'No active admin session found' } })
		: adminAuth.admins
				.removeAdmin(req.body.email)
				.then((results) => {
					res.json({ status: { success: 'Admin account removed' } })
				})
				.catch((err) => res.json({ status: { failure: err } }))
})

// Add a parent
app.post('/admin/parents/add', (req, res, next) => {
	!req.session.admin
		? res.json({ status: { failure: 'No active admin session found' } })
		: adminAuth.parents
				.addParent(
					req.body.firstName,
					req.body.lastName,
					req.body.password,
					req.body.nChildren,
					req.body.email
				)
				.then((result) => res.json(result))
				.catch((err) => res.json(err))
})

// Update parent
app.post('/admin/parents/update', (req, res, next) => {
	!req.session.admin
		? res.json({ status: { failure: 'No active admin session found' } })
		: adminAuth.parents
				.updateParent(
					req.body.firstName,
					req.body.lastName,
					req.body.email,
					req.body.nChildren
				)
				.then((result) =>
					res.json({
						status: { success: 'Parent account updated' },
					})
				)
				.catch((err) =>
					res.json({
						status: { failure: err },
					})
				)
})

//Remove Parent
app.post('/admin/parents/remove', (req, res, next) => {
	!req.session.admin
		? res.json({ status: { failure: 'No active admin session found' } })
		: adminAuth.parents
				.removeParent(req.body.email)
				.then((results) => {
					res.json({ status: { success: 'Parent account removed' } })
				})
				.catch((err) => res.json({ status: { failure: err } }))
})

// WARD OPERATIONS
// Add Ward
app.post('/admin/wards/add', (req, res, next) => {
	!req.session.admin
		? res.json({ status: { failure: 'No active admin session found' } })
		: adminAuth.wards
				.addWard(
					req.body.wardAge,
					req.body.wardFirstName,
					req.body.wardLastName,
					req.body.parentId,
					req.body.classId
				)
				.then((obj) => res.json(obj))
				.catch((err) => res.json(err))
})

// Remove Ward
app.post('/admin/wards/remove', (req, res, next) => {
	!req.session.admin
		? res.json({ status: { failure: 'No active admin session found' } })
		: adminAuth.wards
				.removeWard(
					req.body.wardAge,
					req.body.wardFirstName,
					req.body.wardLastName,
					req.body.parentId,
					req.body.classId
				)
				.then((obj) => res.json(obj))
				.catch((err) => res.json(err))
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
