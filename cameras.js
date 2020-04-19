const error = require('./error_codes');
const cryptor = require('./secrets').camera_cryptor;
const db_connector = require('./secrets').db_connection;

var camera_data = {};

function cameraExists(camera_id) {
  
  return false;
}

function getCameraData(camera_id) {}

module.exports = {
  getCameraData,
  cameraExists
};
