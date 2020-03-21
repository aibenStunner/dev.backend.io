const path = require('path');

module.exports = {
  get_404(res) {
    res.sendFile(path.join(__dirname + '/resx/404.html'));
  }
};
