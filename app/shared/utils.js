
define(['exports'], function(exports) {
  exports.bindRoutes = function(Router, packages) {
    var methodName, packageEl, pkg, route, _i, _len, _ref;
    for (_i = 0, _len = packages.length; _i < _len; _i++) {
      packageEl = packages[_i];
      pkg = new packageEl();
      _ref = pkg.routes;
      for (route in _ref) {
        methodName = _ref[route];
        Router.route(route, methodName, pkg[methodName]);
      }
    }
  };
});
