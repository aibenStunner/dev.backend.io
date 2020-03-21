const camera = require('./cameras');
module.exports = {
  login(req, res) {},

  feed(req, res, LOGGED_IN) {
    let camera_name = req.body.camera;
    if (LOGGED_IN) {
      // Check if logged in
      if (camera.cameraExists(camera_name)) {
        // Check if camera exists
        res.json(camera.getCameraData(camera_name));
      }
    } else res.json('Access Denied');
  }
};
