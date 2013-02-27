
define(function() {
  var state;
  state = {};
  return {
    get: function(key) {
      return state[key];
    },
    set: function(key, val) {
      return state[key] = val;
    },
    "delete": function(key) {
      return delete state[key];
    }
  };
});
