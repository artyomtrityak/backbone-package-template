define ['exports'], (exports)->
	
	exports.getPackagesRoutes = (packages)->
		packagesMethods = {}
		packagesRoutes = {}

		_.reduce packages, (methods, packageEl)->
			_.extend packagesRoutes, packageEl.routes
			_.extend(methods, packageEl)
		, packagesMethods

		delete packagesMethods.routes

		{
			methods: packagesMethods
			routes: packagesRoutes
		}

	return;