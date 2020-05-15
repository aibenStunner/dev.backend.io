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
				reject(error)
			} else if (!results[0]) {
				connection.end()
				resolve('Query Executed: No rows returned')
			} else {
				connection.end()
				resolve(results)
			}
		})
	}).catch((err) => console.error('Query Failed'))
}

module.exports = executeQuery
