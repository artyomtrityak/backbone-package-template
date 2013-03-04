define (require, exports, module) ->
	
	# Packages loading	
	demoPackage = require 'packages/demo'
	orgPackage = require 'packages/organization'
	
	#Utils and other
	Utils = require 'shared/utils'

	if module.config().fakeServer
		server = require 'server'
		server.start()

	exports.App = Backbone.Router.extend {
		routes:
			'*other': 'unknownRoute'

		initialize: ->
			Utils.bindRoutes @, [
				demoPackage.Controller
				orgPackage.Controller
			]

		unknownRoute: ->
			console.log 'unknown'
	}
	return
