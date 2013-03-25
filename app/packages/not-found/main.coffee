define (require, exports, module)->
	View = require './view'
	Model = require './model'
	BaseController = require 'shared/base_controller'

	class Controller extends BaseController
		routes: 
			'*other': 'notFoundRoute'

		notFoundRoute: ->
			@currentView = new View model: new Model()
			$('#demo-box').html @currentView.render().$el