const fetch = require('node-fetch')
const GodseyeSQL = require('../db/sql_promise')

/**
 *
 * @param {Number} cameraId The url to the raw stream
 * @param {Response} res The Writable Stream to pipe the response through
 */
function getFeed(cameraId, parentId, res) {
	let magic =
		parseInt(cameraId) >= 5000
			? GodseyeSQL.executeQuery(
					`SELECT camera_link FROM public_camera_location WHERE camera_ID = ${cameraId}`
			  )
			: GodseyeSQL.executeQuery(
					`SELECT camera_link FROM parent_ward_class WHERE cameraId = ${cameraId} AND parentId=${parentId}`
			  )
	magic
		.then((results) => {
			let url =
				results && results[0]
					? results[0].camera_link
					: res.json({
							status: {
								failure: 'Access denied to this resource',
							},
					  })
			fetch(url)
				.then((response) => {
					res.setHeader(
						'content-type',
						response.headers.get('content-type')
					)
					response.body.pipe(res)
				})
				.catch((err) => res.json({ status: { failure: err } }))
		})
		.catch((err) => res.json(err))
}

function getFeedWithToken(token, res) {
	getFeed(cameraId, parentId, res)
}

module.exports = getFeed
