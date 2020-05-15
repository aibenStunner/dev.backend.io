const bcrypt = require('bcrypt')
const saltRounds = 10

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
	return bcrypt
		.compare(password, hash)
		.catch((err) => {
			console.log(err)
		})
}

module.exports = { hashPassword, comparePassword }
