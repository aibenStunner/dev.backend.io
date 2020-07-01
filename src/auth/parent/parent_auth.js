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
			`SELECT * from parent WHERE email='${email}'`
		).then((result) => {
			if (!result) {
				reject({ failure: { reason: 'User not found' } })
			} else {
				HashSuite.comparePassword(password, result[0].password).then(
					(isMatch) => {
						if (isMatch) {
							resolve({
								status: {
									success: 'Parent logged in',
								},
								user: result[0],
							})
						} else {
							reject({
								status: { failure: 'Wrong password' },
							})
						}
					}
				)
			}
		})
	})
}

/**
 *
 * @param {String} firstName
 * @param {String} lastName
 * @param {String} hash
 * @param {Number} n_Children
 * @param {String} email
 */
function signup(firstName, lastName, password, n_Children, email) {
	return new Promise((resolve, reject) => {
		GodseyeSQL.executeQuery(
			`SELECT parentId from parent WHERE email='${email}'`
		).then((result) => {
			if (result) {
				reject({ status: { failure: 'This email already exists' } })
			} else {
				HashSuite.hashPassword(password).then((hash) => {
					GodseyeSQL.executeQuery(
						`INSERT INTO parent (firstName, lastName, password, n_Children, email) VALUES ('${firstName}','${lastName}','${hash}',${n_Children},'${email}')`
					)
						.then((result) => {
							if (!result) {
								resolve({
									status: { success: 'Account created' },
								})
							} else {
								reject({
									status: {
										fatal:
											'Impossible condition evaluated true',
									},
								})
							}
						})
						.catch((err) => reject(err))
				})
			}
		})
	})
}

module.exports = { login, signup }
