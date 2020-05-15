const fetch = require('node-fetch')
/**
 *
 * @param {String} cameraLink The tunneled url to the camera
 * @param {String} password The password to access the feed
 * @param {Response} res
 */
function getFeed(cameraLink, res) {
	fetch(cameraLink)
		.then((response) => {
			res.setHeader('content-type', response.headers.get('content-type'))
			response.body.pipe(res)
		})
		.catch((reason) => console.log(reason))
}
module.exports = { getFeed }
