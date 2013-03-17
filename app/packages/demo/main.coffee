define (require, exports, module)->
	View = require './view'
	Model = require './model'
	BaseController = require 'shared/base_controller'

	class Controller extends BaseController
		routes:
			'demo': 'demo'
			'demo/:id': 'demo'

		demo: (id=0) ->
			console.log 'demo'
			@currentView = new View(
				model: new Model()
			)
			$('#demo-box').html @currentView.render().$el
			@
