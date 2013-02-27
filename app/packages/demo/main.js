
define(function(require, exports, module) {
  var model, view;
  view = require('./view');
  model = require('./model');
  exports.Controller = {
    routes: {
      'demo': 'demo'
    },
    demo: function() {
      var viewIns;
      console.log('demo');
      viewIns = new view.View({
        model: new model.Model()
      });
      $('#demo-box').html(viewIns.render().$el);
      return this;
    }
  };
});
