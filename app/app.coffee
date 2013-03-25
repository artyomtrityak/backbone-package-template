define (require, exports, module) ->
	
	# Packages loading	
	# It's demo pachages, remove them
	notFoundPackage = require 'packages/not-found'
	demoPackage = require 'packages/demo'
	listViewPackage = require 'packages/list-view-demo'
	
	#Utils and other
	Utils = require 'shared/utils'

	if module.config().fakeServer
		server = require 'server'
		server.start()

	class App extends Backbone.Router
		constructor: ->
			Utils.bindRoutes @, [
				notFoundPackage
				demoPackage
				listViewPackage
			]

