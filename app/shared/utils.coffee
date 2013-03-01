define ['exports'], (exports)->
	
	exports.bindRoutes = (Router, packages)->
		for packageEl in packages
			pkg = new packageEl()

			for route, method of pkg.routes then do (pkg, route, method) ->
				Router.route route, method, ->
					argsWithDetails = Array.prototype.slice.call arguments;
					argsWithDetails.unshift method
					
					pkg.onBeforeRequest.apply pkg, argsWithDetails
					pkg[method].apply pkg, arguments
					pkg.onAfterRequest.apply pkg, argsWithDetails
		return
	return