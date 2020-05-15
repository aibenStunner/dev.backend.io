const hasher = require('./src/hash/hash_suite')

hasher
	.hashPassword('Koo Nie')
	.then((hash) =>
		hasher
			.comparePassword('Koo 0Nie', hash)
			.then((isMatch) => console.log(isMatch))
	)
