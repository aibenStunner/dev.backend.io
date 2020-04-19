const express = require('express')
const app = express()
const port = 5000

// GET Handler
app.get('/*', (req, res) =>
	res.sendFile('/public/index.html', { root: __dirname }, (err) =>
		console.error(err)
	)
)

// POST Handlers 
app.post('login', (req, res) => {})

app.post('logout', (req, res) => {})

app.post('feed', (req, res) => {})

app.listen(port, console.log(`Godseye Server live on port ${port}`))
