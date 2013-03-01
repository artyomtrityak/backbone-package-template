var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(function(require, exports, module) {
  var Controller, DefaultController, model, view;
  view = require('./view');
  model = require('./model');
  DefaultController = require('shared/default_controller');
  exports.Controller = Controller = (function(_super) {
    var _this = this;

    __extends(Controller, _super);

    function Controller() {
      return Controller.__super__.constructor.apply(this, arguments);
    }

    Controller.prototype.routes = {
      'demo2': 'demo'
    };

    Controller.prototype.before = {
      'demo': function() {
        return Controller.onBefore();
      }
    };

    Controller.prototype.onBefore = function() {
      return console.log('before');
    };

    Controller.prototype.demo = function() {
      var viewIns;
      console.log('demo');
      viewIns = new view.View({
        model: new model.Model()
      });
      $('#demo-box').html(viewIns.render().$el);
      return this;
    };

    return Controller;

  }).call(this, DefaultController);
});
