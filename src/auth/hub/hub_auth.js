let GodseyeSQL = require('../../db/sql_promise')

const cameraExists = (camera_name) => {
	return new Promise((resolve, reject) => {
		GodseyeSQL.executeQuery(
			`SELECT cameraId from camera WHERE camera_name='${camera_name}'`
		).then((result) => resolve(result != undefined))
	})
}

const updateCamera = (cameraDataObj) => {
	return new Promise((resolve, reject) => {
		cameraExists(cameraDataObj.camera_name).then((cameraDoesExist) => {
			if (!cameraDoesExist) {
				reject({
					status: { failure: 'camera_name does not exist' },
				})
			} else {
				GodseyeSQL.executeQuery(
					`UPDATE camera SET camera_link = '${cameraDataObj.camera_link}' WHERE camera_name = '${cameraDataObj.camera_name}'`
				)
					.then(() => {
						resolve({
							status: { success: 'link has been updated' },
						})
					})
					.catch((err) => {
						reject({
							status: { failure: err },
						})
					})
			}
		})
	})
}

const registerCamera = (cameraDataObj) => {
	return new Promise((resolve, reject) => {
		cameraExists(cameraDataObj.camera_name).then((cameraDoesExist) => {
			if (cameraDoesExist) {
				reject({
					status: { failure: 'This camera_name already exists' },
				})
			} else {
				GodseyeSQL.executeQuery(
					`INSERT INTO camera (camera_name, camera_link, camera_password) VALUES ('${cameraDataObj.camera_name}','${cameraDataObj.camera_link}','${cameraDataObj.camera_password}')`
				)
					.then((result) => {
						if (!result) {
							resolve({
								status: {
									success: 'camera succesfully registered',
								},
							})
						}
					})
					.catch((err) => {
						reject({
							status: {
								failure: err,
							},
						})
					})
			}
		})
	})
}

const deleteCamera = (cameraDataObj) => {
	return new Promise((resolve, reject) => {
		cameraExists(cameraDataObj.camera_name).then((cameraDoesExist) => {
			if (!cameraDoesExist) {
				reject({
					status: { failure: "This camera_name doesn't exist" },
				})
			} else {
				GodseyeSQL.executeQuery(
					`DELETE FROM camera WHERE camera_name = '${cameraDataObj.camera_name}'`
				)
					.then((result) => {
						resolve({
							status: { success: 'camera succesfully deleted' },
						})
					})
					.catch((err) => {
						reject({
							status: { failure: err },
						})
					})
			}
		})
	})
}

module.exports = { updateCamera, registerCamera, deleteCamera }
