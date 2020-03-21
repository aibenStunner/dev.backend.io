const SimpleCrypto = require('simple-crypto-js').default;

const camera_encryption_secret = 'dev.io' + new Date().getDate().toString();

module.exports = {
  camera_cryptor: new SimpleCrypto(camera_encryption_secret)
};
