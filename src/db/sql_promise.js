/**
 * @author Kevin Nene Otuteye
 */
const mysql = require('mysql')
const credentials = require('./credentials.json')

/**
 *
 * @param {String} query The sql query string
 */
function executeQuery(query) {
	return new Promise((resolve, reject) => {
		const connection = mysql.createConnection(credentials.RDS)
		connection.connect()
		connection.query(query, (error, results, fields) => {
			if (error) {
				reject(error.sqlMessage)
			} else if (!results[0]) {
				connection.end()
				resolve(undefined)
			} else {
				connection.end()
				resolve(results)
			}
		})
	})
}

module.exports = { executeQuery }
