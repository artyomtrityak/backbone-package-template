
define(function(require, exports, module) {
  var tpl;
  tpl = require('text!./templates/demo.html');
  exports.View = Backbone.View.extend({
    template: _.template(tpl),
    events: {
      'click #demo-open': 'showNotification'
    },
    initialize: function() {
      if (this.model != null) {
        Backbone.Validation.bind(this);
      }
    },
    render: function() {
      this.$el.html(this.template({
        data: {
          username: 'Artyom'
        }
      }));
      return this;
    },
    showNotification: function() {
      this.$('#demoModal').modal('show');
      return this;
    }
  });
});
