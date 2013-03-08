define (require, exports, module) ->
	
	tpl = require 'text!./templates/users.html'
	UserView = require './user_view'
	BasePaginatedView = require 'shared/pagination/base_paginated_view'

	class UsersView extends BasePaginatedView

		template: _.template tpl

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

			@_getPaginationContainer().append @pagesView.render().$el

			return @
