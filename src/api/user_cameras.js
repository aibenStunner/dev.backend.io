const GodseyeSQL = require('../db/sql_promise')

/**
 * @param {String} parentId
 */
function getUserCameras(parentId) {
	return new Promise((resolve, reject) => {
		GodseyeSQL.executeQuery(
			`SELECT wardFirstName, cameraId, camera_name, camera_link FROM parent_ward_class WHERE parentId = ${parentId}`
		).then((result) => {
			if (!result || !result[0]) {
				resolve([])
			} else {
				let cameraData = []
				result.forEach((row) => {
					let {
						wardFirstName,
						cameraId,
						camera_name,
						camera_link,
					} = row
					cameraData.push({
						wardFirstName,
						cameraId,
						camera_name,
						camera_link,
					})
				})
				resolve(cameraData)
			}
		})
	})
}

module.exports = getUserCameras
