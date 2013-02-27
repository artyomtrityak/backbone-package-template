
define(function(require, exports, module) {
  var Controller;
  return Controller = (function() {

    function Controller() {
      console.log("aa");
    }

    Controller.prototype.beforeRequest = function() {
      return console.log("before");
    };

    Controller.prototype.destructor = function() {
      return console.log("destructor2");
    };

    return Controller;

  })();
});
