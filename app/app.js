
define(function(require, exports, module) {
  var Utils, demoPackage, server;
  demoPackage = require('packages/demo');
  Utils = require('shared/utils');
  if (module.config().fakeServer) {
    server = require('server');
    server.start();
  }
  exports.App = Backbone.Router.extend({
    routes: {
      '*other': 'unknownRoute'
    },
    initialize: function() {
      return Utils.bindRoutes(this, [demoPackage.Controller]);
    },
    unknownRoute: function() {
      return console.log('unknown');
    }
  });
});
