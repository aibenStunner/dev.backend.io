const GodseyeSQL = require('../../db/sql_promise')
const HashSuite = require('../../hash/hash_suite')
const { reject } = require('bcrypt/promises')
const { __esModule } = require('node-fetch')

/**
 *
 * @param {String} firstName
 * @param {String} lastName
 * @param {String} password
 * @param {Number} n_Children
 * @param {String} email
 */

// ADMIN OPERATIONS
// Add an admin
function addAdmin(firstName, lastName, password, email, phoneNumber) {
	return new Promise((resolve, reject) => {
		GodseyeSQL.executeQuery(
			`SELECT admin from admin WHERE adminEmail='${email}'`
		).then((result) => {
			if (result) {
				reject({ status: { failure: 'This email already exists' } })
			} else {
				HashSuite.hashPassword(password).then((hash) => {
					GodseyeSQL.executeQuery(
						`INSERT INTO admin (adminFirstName, adminLastName, password, adminEmail, adminPhoneNumber) VALUES ('${firstName}','${lastName}','${hash}',${email},'${phoneNumber}')`
					)
						.then((result) => {
							if (!result) {
								resolve({
									status: { success: 'Account created' },
								})
							}
						})
						.catch((err) => reject(err))
				})
			}
		})
	})
}

// Remove an admin
function removeAdmin(email) {
	return new Promise((resolve, reject) => {
		GodseyeSQL.executeQuery(`DELETE FROM admin WHERE adminEmail='${email}'`)
	})
}

// PARENT OPERATIONS
// Add a parent
function addParent(firstName, lastName, password, n_Children, email) {
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
							}
						})
						.catch((err) => reject(err))
				})
			}
		})
	})
}
