const cryptor = require('./secrets').camera_cryptor;

var camera_data = {};
const _camera_data = {
  cam_golf: 'http://wmccpinetop.axiscam.net/mjpg/video.mjpg',
  cam_two: 'http://208.72.70.172/mjpg/video.mjpg',
  cam_three: 'http://158.58.130.148/mjpg/video.mjpg',
  cam_proto: 'http://192.168.1.102:8081'
};

Object.keys(_camera_data).forEach(key => {
  camera_data[key] = cryptor.encrypt(_camera_data[key]);
});

function cameraExists(camera_name) {
  return Object.keys(camera_data).includes(camera_name);
}

function getCameraData(camera_name) {
  return {
    camera: camera_name,
    location: camera_data[camera_name]
  };
}

module.exports = {
  getCameraData,
  cameraExists
};

/* Test
console.log(camera_data);
*/
