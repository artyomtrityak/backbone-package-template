define (require, exports, module) ->
	
	tpl = require 'text!./templates/users.html'
	UserView = require './user_view'
	BaseView = require 'shared/base_view'

	#class UsersView extends BaseView
	UsersView = BaseView.extend
		
		template: _.template tpl
		collection: null
		
		initialize: (options) ->
			return @

		_getItemsContainer: () ->
			unless @$itemsContainer
				@$itemsContainer = $ 'tbody.items', @$el
			@$itemsContainer

		render: ->
			
			@$el.html @template()
			
			unless @collection
				return @

			$buffer = $ '<div>'
			@collection.each (user) =>
				userView = new UserView
					model: user

				$buffer.append userView.render().$el
			@_getItemsContainer().append $buffer.html()

			return @
