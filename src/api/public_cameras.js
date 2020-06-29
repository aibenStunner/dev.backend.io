const GodseyeSQL = require('../db/sql_promise')

function getPublicCameraIDs() {
	return new Promise((resolve, reject) => {
		GodseyeSQL.executeQuery(`SELECT camera_ID FROM teacher`)
			.then((results) => resolve(results))
			.catch((err) => reject(err))
	})
}
