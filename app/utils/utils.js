define(['exports'], function (exports) {

	exports.getPackagesRoutes = function (packages) {
		var packagesMethods = {},
				packagesRoutes = {};

		_.reduce(packages, function(methods, packageEl){
			_.extend(packagesRoutes, packageEl.routes);
			return _.extend(methods, packageEl);
		}, packagesMethods);
		
		delete packagesMethods.routes;

		return {
			packagesMethods: packagesMethods,
			packagesRoutes: packagesRoutes
		};
	};
	
});