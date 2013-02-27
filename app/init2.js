
require(['app'], function(Application) {
  var app;
  app = new Application.App();
  return Backbone.history.start();
});
