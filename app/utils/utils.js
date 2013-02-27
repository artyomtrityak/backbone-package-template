
define(['exports'], function(exports) {
  exports.getPackagesRoutes = function(packages) {
    var packagesMethods, packagesRoutes;
    packagesMethods = {};
    packagesRoutes = {};
    _.reduce(packages, function(methods, packageEl) {
      _.extend(packagesRoutes, packageEl.routes);
      return _.extend(methods, packageEl);
    }, packagesMethods);
    delete packagesMethods.routes;
    return {
      methods: packagesMethods,
      routes: packagesRoutes
    };
  };
});
