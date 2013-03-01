define ['exports'], (exports)->
	
	exports.bindRoutes = (Router, packages)->
		for packageEl in packages

			pkg = new packageEl()

			for route, methodName of pkg.routes
				Router.route route, methodName, pkg[methodName]
		return
	return