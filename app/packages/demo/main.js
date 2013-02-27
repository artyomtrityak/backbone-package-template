
define(function(require, exports, module) {
  var model, view;
  view = require('./view');
  model = require('./model');
  exports.Controller = {
    routes: {
      'demo': 'demo'
    },
    before: {
      'demo': function() {
        return this.onBefore();
      }
    },
    onBefore: function() {
      return console.log('before');
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
