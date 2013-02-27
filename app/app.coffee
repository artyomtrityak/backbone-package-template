define (require, exports, module) ->

	# shared application state
	appState = require 'shared/app_state'
	
	# Packages loading	
	demoPackage = require 'packages/demo'
	
	#Utils and other
	Utils = require 'shared/utils'

	packages = Utils.getPackagesRoutes [
		demoPackage.Controller
	]

	if module.config().fakeServer
		server = require 'server'
		server.start()

	exports.App = Backbone.Router.extend _.extend {},
		packages.methods,
		{
			routes: _.extend {},
				packages.routes,
				{
					'*other': 'unknownRoute'
				}
			unknownRoute:->
				console.log 'unknown'
		}
	return
