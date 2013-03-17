define (require, exports, module)->
	tpl = require 'text!./templates/friend.html'
	BaseView = require 'shared/base_view'

	class View extends BaseView
		template: _.template tpl

		initialize: ->
			Backbone.Validation.bind(this) if @model?
			return

		render: ->
			@$el = @template company:@model.toJSON()
			return @