const bcrypt = require('bcrypt')

const saltRounds = 10

/**
 *
 * @param {String} password The password to be hashed
 * @param {Function} callback The callback that receives the hash
 * @returns {void} Access the hash through the callback
 */
function hashPassword(password, callback) {
	bcrypt.genSalt(saltRounds, function (err, salt) {
		if (err) throw err
		bcrypt.hash(password, salt, function (err, hash) {
			if (err) throw err
			return callback(hash)
		})
	})
}
