const mysql = require('mysql')
const DBMeta = require('./db_cred')

/**
 *
 * @param {String} username
 * @param {String} password
 * @returns {} Returns true if login is successful, false if record was not found, and throws a MySQL error if generated.
 */
function login(username, password, callback) {
	const connection = mysql.createConnection(DBMeta.godseyeDB)
	connection.connect()
	console.log(`${username}:${password}`)

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
