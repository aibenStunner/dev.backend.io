/**
 * @author Kevin Nene Otuteye
 */
const mysql = require('mysql')
const DBMeta = require('../auth/db_cred')
const hashSuite = require('../password_hasher')
/**
 * @param {Object} parentObj
 */
function signUp(parentObj) {
	return new Promise((resolve, reject) => {
		let arr = []
		const connection = mysql.createConnection(DBMeta.godseyeDB)
		connection.connect()
		connection.query(
			`INSERT INTO parent (username, firstName, lastName, password)
            VALUES (value1, value2, value3, ...);
            `,
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

module.exports = signUp
