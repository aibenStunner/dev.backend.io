const camera = require('./cameras');
module.exports = {
  login(req, res) {},

  feed(req, res, LOGGED_IN) {
    let camera_name = req.query.camera;

    if (camera_name != null && LOGGED_IN && camera.cameraExists(camera_name))
      res.json(camera.getCameraData(camera_name));
    else res.json('Access Denied');
  }
};
