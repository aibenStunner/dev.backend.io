module.exports = {
	godseyeDB: {
		host: process.env.RDS_HOSTNAME,
		user: process.env.RDS_USERNAME,
		password: process.env.RDS_PASSWORD,
		port: process.env.RDS_PORT,
		
		database: 'godseye_db',
	},
}
