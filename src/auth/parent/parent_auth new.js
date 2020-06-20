const GodseyeSQL = require('../../db/sql_promise')
const HashSuite = require('../../hash/hash_suite')

/**
 *
 * @param {String} email
 * @param {String} password
 */

function login(email, password) {
	return new Promise((resolve, reject) => {
		GodseyeSQL.executeQuery(
			`SELECT * from parent_ward_class WHERE email='${email}'`
		)
			.then((result) => {
				if (!result) {
					reject({ failure: { reason: 'User not found' } })
				} else {
					HashSuite.comparePassword(
						password,
						result[0].password
					).then((isMatch) => {
						if (isMatch) {
							let record = {
								parentId: result[0].parentId,
								firstName: result[0].firstName,
								lastName: result[0].lastName,
								data: [],
							}
							result.forEach((obj) => {
								record.data.push({
									ward: {
										wardFirstName: obj.wardFirstName,
										wardLastName: obj.wardLastName,
									},
									classroom: { className: obj.className },
									camera: {
										cameraId: obj.cameraId,
										cameraName: obj.cameraName,
									},
									teacher: {
										teacherFirstName: obj.teacherFirstName,
										teacherLastName: obj.teacherLastName,
										teacherContact: obj.teacherContact,
										isHeadmaster:
											obj.isHeadmaster == 1
												? true
												: false,
									},
								})
							})
							resolve({
								status: {
									success: 'Parent logged in',
								},
								user: record,
							})
						} else {
							reject({
								status: { failure: 'Wrong password' },
							})
						}
					})
				}
			})
			.catch((err) => reject({ status: { failure: err } }))
	})
}

/**
 *
 * @param {Request} req
 * @returns {Object} The status object
 */
function logout(req) {
	if (req.session.user) {
		req.session.destroy((err) => {
			if (err) throw err
		})
		return { status: { success: 'Session ended' } }
	} else {
		return { status: { failure: 'No active session found' } }
	}
}

module.exports = { login, logout }
