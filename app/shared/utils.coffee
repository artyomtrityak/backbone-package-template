define ['exports'], (exports)->
	
	exports.bindRoutes = (Router, packages)->
		for packageEl in packages
			pkg = new packageEl()

			for route, method of pkg.routes then do (pkg, route, method) ->
				Router.route route, method, ->
					args = Array.prototype.slice.call arguments;
					args.unshift method
					
					pkg.onBeforeRequest.apply(pkg, args) 
					pkg[method].apply(pkg, args) 
					pkg.onAfterRequest.apply(pkg, args) 
		return
	return