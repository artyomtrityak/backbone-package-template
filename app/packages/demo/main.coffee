define (require, exports, module)->
	view = require './view'
	model = require './model'
	BaseController = require 'shared/base_controller'

	exports.Controller = class Controller extends BaseController
		routes:
			'demo2': 'demo'
			'demo/:id': 'demo'

		demo: ->
			console.log 'demo'
			viewIns = new view.View(
				model: new model.Model()
			)
			$('#demo-box').html viewIns.render().$el
			return @
	return
