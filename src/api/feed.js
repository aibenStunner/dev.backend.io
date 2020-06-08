const fetch = require('node-fetch')

/**
 *
 * @param {String} cameraLink The url to the raw stream
 * @param {Response} res The object to pipe the response through
 */
function getFeed(cameraLink, res) {
	return new Promise((resolve, reject) => {
		fetch(cameraLink)
			.then((response) => {
				res.setHeader(
					'content-type',
					response.headers.get('content-type')
				)
				response.body.pipe(res)
			})
			.catch((err) => reject({ status: { failure: err } }))
	})
}

module.exports = getFeed
