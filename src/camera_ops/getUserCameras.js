/**
 * @author Kevin Nene Otuteye
 */
const mysql = require('mysql')
const DBMeta = require('./db_cred')
const hashSuite = require('./password_hasher')
/**
 *
 * @param {String} parentId
 * @param {Function} callback
 * @returns {void} Access the fetched record through the callback
 */
function getUserCameras(parentId, callback) {
	const connection = mysql.createConnection(DBMeta.godseyeDB)
	connection.connect()
	connection.query(
		`SELECT cameraId,camera_name,camera_link from parent_ward_class WHERE parentId='${parentId}'`,
		function (error, results, fields) {
			console.log(results)

			if (error) throw error
			if (!results[0]) {
				connection.end()
				return callback(undefined)
			} else {
				hashSuite.comparePassword(
					password,
					results[0].password,
					(isMatch) => {
						connection.end()
						return isMatch
							? callback(results[0])
							: callback(undefined) //isn't she beautiful
					}
				)
			}
		}
	)
}

module.exports = getUserCameras
