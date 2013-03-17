define (require, exports, module)->
	tpl = require 'text!./templates/demo.html'
	BaseView = require 'shared/base_view'

	class MyView extends BaseView
		template: _.template tpl

		events: 
			'click #demo-open': 'showNotification'

		initialize: ->
			Backbone.Validation.bind(this) if @model?
			return

		render: ->
			@$el.html @template(
				data: 
					username: 'Artyom'
			)
			@

		showNotification: ->
			@$('#demoModal').modal 'show'
			@