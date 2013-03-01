define (require, exports, module) ->
	class BaseView extends Backbone.View
		dispose: ->
			@remove()
