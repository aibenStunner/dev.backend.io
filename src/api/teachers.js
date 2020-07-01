const GodseyeSQL = require('../db/sql_promise')

function fetchTeachers() {
	return new Promise((resolve, reject) => {
		GodseyeSQL.executeQuery(`SELECT * FROM teacher`)
			.then((results) => resolve(results))
			.catch((err) => reject(err))
	})
}

module.exports = fetchTeachers
