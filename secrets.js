const SimpleCrypto = require('simple-crypto-js').default;
const mysql = require('mysql');

const camera_encryption_secret = 'dev.io' + new Date().getDate().toString();

module.exports = {
  camera_cryptor: new SimpleCrypto(camera_encryption_secret),
  db_connection: mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'godseye_db'
  })
};
