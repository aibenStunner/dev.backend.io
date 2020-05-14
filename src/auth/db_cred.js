module.exports = {
	godseyeDB: {
		host: process.env.RDS_HOSTNAME,
		user: process.env.RDS_USERNAME,
		password: process.env.RDS_PASSWORD,
		port: process.env.RDS_PORT,
		database: 'new_schema',
	},
}
// module.exports = {
// 	godseyeDB: {
// 		host: 'dev-io.cc3nd9wih4lf.us-east-2.rds.amazonaws.com',
// 		user: 'admin',
// 		password: 'dev.io12345',
// 		port: '3306',
// 		database: 'new_schema',
// 	},
// }
