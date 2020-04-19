const express = require('express')
const app = express()
const port = 5000

/**@summary This handles all GET requests to the server */
app.get('/*', (req, res) =>
	res.sendFile('/public/index.html', { root: __dirname }, (err) =>
		console.error(err)
	)
)

app.listen(port, console.log(`Godseye Server live on port ${port}`))
