const express = require('express')
const app = express()
const port = 5000

// GET Handler
app.get('/*', (req, res) =>
	res.sendFile('/views/index.html', { root: __dirname }, (err) => {
		if (err) console.error(err)
	})
)

// POST Handlers
app.post('login', (req, res) => {})

app.post('logout', (req, res) => {})

app.post('feed', (req, res) => {})

app.listen(port, console.log(`Godseye Server live on port ${port}`))

/**@todo Implement Passport Strategy */