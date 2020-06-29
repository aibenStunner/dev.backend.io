const GodseyeSQL = require('../db/sql_promise')

function getPublicCameraIDs() {
	return new Promise((resolve, reject) => {
		GodseyeSQL.executeQuery(`SELECT camera_ID FROM public_camera_location`)
			.then((results) => {
				let arr = []
				results.forEach((obj) => arr.push(obj.camera_ID))
				resolve(arr)
			})
			.catch((err) => reject(err))
	})
}

module.exports = getPublicCameraIDs
