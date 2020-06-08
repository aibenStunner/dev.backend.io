/**
 * @author Kevin Nene Otuteye
 */
const mysql = require('mysql')
const DBMeta = require('../../db/credentials.json')
const hashSuite = require('../../hash/hash_suite')
/**
 *
 * @param {String} username
 * @param {String} password
 * @param {Function} callback
 * @returns {void} Access the fetched record through the callback
 */
function login(email, password, callback) {
	const connection = mysql.createConnection(DBMeta.godseyeDB)
	connection.connect()
	connection.query(`SELECT * from parent WHERE email='${email}'`, function (
		error,
		results,
		fields
	) {
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
					return isMatch ? callback(results[0]) : callback(undefined) //isn't she beautiful
				}
			)
		}
	})
}

module.exports = login
