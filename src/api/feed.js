const fetch = require('node-fetch')

/**
 *
 * @param {String} cameraLink The url to the raw stream
 * @param {Response} res The object to pipe the response through
 */
function getFeed(cameraLink, res) {
	fetch(cameraLink)
		.then((response) => {
			res.setHeader('content-type', response.headers.get('content-type'))
			response.body.pipe(res)
		})
		.catch((err) => console.log(err))
}

module.exports = { getFeed }
