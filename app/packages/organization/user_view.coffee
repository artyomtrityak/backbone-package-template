define (require, exports, module) ->

	tpl = require 'text!./templates/user.html'
	BaseView = require 'shared/base_view'

	class UserView extends BaseView

		tagName: 'tr'
		className: 'user-item'
		template: _.template tpl

		render: ->
			@$el.html @template data: @model.toJSON()
			return @
