define (require, exports, module)->
	view = require './view'
	model = require './model'
	DefaultController = require 'shared/default_controller'

	exports.Controller = class Controller extends DefaultController
		routes:
			'demo2': 'demo'

		before: 
			'demo': => @onBefore()

		onBefore: ->
			console.log 'before'

		demo: ->
			console.log 'demo'
			viewIns = new view.View(
				model: new model.Model()
			)
			$('#demo-box').html viewIns.render().$el
			return @
	return