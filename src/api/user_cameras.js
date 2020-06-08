const DBMeta = require('../db/credentials.json')
const GodseyeSQL = require('../db/sql_promise')
const hashSuite = require('../hash/hash_suite')
/**
 * @param {String} parentId
 */
function getUserCameras(parentId) {
	return new Promise((resolve, reject) => {
		GodseyeSQL.executeQuery(
			`SELECT wardFirstName, camera_name, camera_link FROM parent_ward_class WHERE parentId = ${parentId}`
		).then((result) => {
			if (!result[0]) {
				resolve([])
			}
			let cameraData = []
			result.forEach((row) => {
				let { wardFirstName, camera_name, camera_link } = row
				cameraData.push({ wardFirstName, camera_name, camera_link })
			})
			resolve(cameraData)
		})
	})
}

module.exports = getUserCameras
