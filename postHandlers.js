const error = require('./error_codes');
const camera = require('./cameras');
module.exports = {
  login() {},

  feed(body, isLoggedIn) {
    if (isLoggedIn) {
      if (body.camera) {
        if (camera.cameraExists(body.camera)) {
          console.log('Yeah');
        } else {
          console.error(error.c025);
        }
      } else {
        console.error(error.c023);
      }
    } else {
      console.error(error.a001);
    }
  }
};
