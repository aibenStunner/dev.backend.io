const bcrypt = require('bcrypt')
const saltRounds = 5

/**
 *
 * @param {String} password The text to hash
 */
function hashPassword(password) {
	return new Promise((resolve, reject) => {
		bcrypt.genSalt(saltRounds, (err, salt) => {
			if (err) {
				reject(err)
			} else {
				bcrypt.hash(password, salt, (err, hash) => {
					if (err) {
						reject(err)
					} else {
						resolve(hash)
					}
				})
			}
		})
	}).catch((err) => console.error(err))
}

function comparePassword(password, hash) {
	return new Promise((resolve, reject) => {
		bcrypt.compare(password, hash, (err, isMatch) => {
			if (err) reject(err)
			else resolve(isMatch)
		})
	})
}

module.exports = { hashPassword, comparePassword }
