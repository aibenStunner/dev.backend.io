const bcrypt = require('bcrypt')

const saltRounds = 10

/**
 *
 * @param {String} password The password to be hashed
 * @param {Function} callback The callback that receives the hash
 * @returns {void} Access the hash through the callback
 */
function hashPassword(password, callback) {
	var result
	bcrypt.genSalt(saltRounds, function (err, salt) {
		if (err) throw err
		bcrypt.hash(password, salt, function (err, hash) {
			if (err) throw err
			callback(hash)
		})
	})
}

/**
 *
 * @param {String} textPassword the raw password received via POST
 * @param {String} hashedPassword the hash from the database
 * @param {Function} onSuccess the callback to apply on password match
 * @param {Function} onFailure the callback to apply on mismatch
 */
function comparePassword(textPassword, hashedPassword, onSuccess, onFailure) {
	bcrypt.compare(myPlaintextPassword, hash, function (err, result) {
		if (err) throw err
		if (result) {
			onSuccess()
		} else {
			onFailure()
		}
	})
}

module.exports = { hashPassword, comparePassword }
