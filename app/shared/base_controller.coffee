define (require, exports, module) ->

	appState = require 'shared/app_state'
	
	class Controller
		currentView: null

		constructor: ->

		onBeforeRequest: ->
			prevController = appState.get 'prevController'

			if @currentView?
				@currentView.dispose()
				@currentView = null

			if prevController? and prevController != @
				prevController.destructor()
			
			appState.set 'prevController', @

		onAfterRequest: ->

		destructor: ->