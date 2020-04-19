const path = require('path');

module.exports = {
  get_404() {
    return path.join(__dirname + '/resx/404.html');
  }
};
