const mysql = require('mysql')
const DBMeta = require('./db_cred')
const hashSuite = require('./password-hasher')
/**
 *
 * @param {String} username
 * @param {String} password
 * @returns {void} Access the fetched record through the callback
 */
function login(username, password, callback) {
	const connection = mysql.createConnection(DBMeta.godseyeDB)
	connection.connect()

	connection.query(
		`SELECT * from parent WHERE email='${username}' AND password='${password}'`,
		function (error, results, fields) {
			let record
			if (error) throw error
			if (!results[0]) {
				record = undefined
			}
			if (results[0]) {
				record = results[0]
			}
			connection.end()
			callback(record)
		}
	)
}

module.exports = login
