var express, path;

express = require('express');

path = require('path');

module.exports = function(options, grunt) {
  var app;
  app = express();
  app.use(express["static"](path.join(__dirname, '/../', options.staticFolder)));
  grunt.log.write(["Server ", options.host, ":", options.port, " started: "].join("")).ok();
  grunt.log.write(["Stacic folder ", options.staticFolder, " is served "].join("")).ok();
  return app.listen(options.port);
};
