define (require, exports, module)->
	tpl = require 'text!./templates/template.html'
	BaseView = require 'shared/base_view'

	class View extends BaseView
		template: _.template tpl

		render: ->
			@$el.html @template(
				data: @model.toJSON()
			)
			@
