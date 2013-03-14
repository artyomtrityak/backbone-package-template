define (require, exports, module)->
	view = require './view'
	model = require './model'
	BaseController = require 'shared/base_controller'

	exports.Controller = class Controller extends BaseController
		routes:
			'demo': 'demo'
			'demo/:id': 'demo'

		demo: ->
			console.log 'demo'
			@currentView = new view.View(
				model: new model.Model()
			)
			$('#demo-box').html @currentView.render().$el
			return @
	return
