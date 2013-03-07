define (require, exports, module) ->
	
	tpl = require 'text!./templates/users.html'
	UserView = require './user_view'
	BasePaginationView = require 'shared/base_pagination_view'

	class UsersView extends BasePaginationView

		template: _.template tpl

		initialize: (options) ->
			super options
			return @

		_getItemsContainer: () ->
			unless @$itemsContainer
				@$itemsContainer = $ 'tbody.items', @$el
			@$itemsContainer

		_getPaginationContainer: ->
			unless @$paginationContainer
				@$paginationContainer = $ 'tfoot td.pagination-wrap', @$el
			@$paginationContainer

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

			@_getPaginationContainer().append @pageView.render().$el

			return @
