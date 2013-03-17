define (require, exports, module) ->
	
	# Packages loading	
	# It's demo pachages, remove them
	demoPackage = require 'packages/demo'
	friendsPackage = require 'packages/friends-demo'

	#TODO: Unknown controller
	
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
				demoPackage
				friendsPackage
			]

		unknownRoute: ->
			console.log 'unknown'
	}
	return
