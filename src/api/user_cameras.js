
const DBMeta = require('../auth/db_cred')
const hashSuite = require('../hash/password_hasher')
/**
 * @param {String} parentId
*/
function getUserCameras(parentId) {
	return new Promise((resolve, reject) => {
		let arr = []
		const connection = mysql.createConnection(DBMeta.godseyeDB)
		connection.connect()
		connection.query(
			`SELECT cameraId,camera_name,camera_link from parent_ward_class WHERE parentId='${parentId}'`,
			function (error, results, fields) {
				if (error) throw error
				if (!results[0]) {
					connection.end()
					reject(undefined)
				} else {
					results.forEach((obj) => {
						arr.push({
							id: obj.cameraId,
							name: obj.camera_name,
							link: obj.camera_link,
						})
					})
					connection.end()
					resolve(arr)
				}
			}
		)
	})
}

module.exports = getUserCameras
