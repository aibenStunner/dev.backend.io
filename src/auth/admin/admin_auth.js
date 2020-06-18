const GodseyeSQL = require('../../db/sql_promise')
const HashSuite = require('../../hash/hash_suite')

// ADMIN OPERATIONS
// Add an admin
/**
 *
 * @param {String} firstName
 * @param {String} lastName
 * @param {String} password
 * @param {String} email
 * @param {String} phoneNumber
 */
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

// Update an admin
function updateAdmin(firstName, lastName, password, email, phoneNumber) {
	return new Promise((resolve, reject) => {
		GodseyeSQL.executeQuery(
			`UPDATE admin SET adminFirstName = '${firstName}', adminLastName='${lastName}', adminPhoneNumber='${phoneNumber}' WHERE adminEmail = '${email}';`
		)
			.then((result) => {
				resolve({ status: { success: 'Admin account updated' } })
			})
			.catch((err) => reject({ status: { failure: err } }))
	})
}

// Remove an admin
function removeAdmin(email) {
	return new Promise((resolve, reject) => {
		GodseyeSQL.executeQuery(`DELETE FROM admin WHERE adminEmail='${email}'`)
			.then((results) => {
				resolve({ status: { success: 'Admin account deleted' } })
			})
			.catch((err) => {
				reject({ status: { failure: err } })
			})
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

// Update a parent
function updateParent(firstName, lastName, email, n_Children) {
	return new Promise((resolve, reject) => {
		GodseyeSQL.executeQuery(
			`UPDATE parent SET firstName = '${firstName}', lastName='${lastName}', n_Children='${n_Children}' WHERE email = '${email}';`
		)
			.then((result) => {
				resolve({ status: { success: 'Parent account updated' } })
			})
			.catch((err) => reject({ status: { failure: err } }))
	})
}

// Remove a parent
function removeParent(email) {
	return new Promise((resolve, reject) => {
		GodseyeSQL.executeQuery(`DELETE FROM parent WHERE email='${email}'`)
			.then((results) => {
				resolve({ status: { success: 'Parent account deleted' } })
			})
			.catch((err) => {
				reject({ status: { failure: err } })
			})
	})
}

module.exports = {
	admins: { addAdmin, updateAdmin, removeAdmin },
	parents: { addParent, updateParent, removeParent },
}
