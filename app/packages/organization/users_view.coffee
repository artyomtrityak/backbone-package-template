define (require, exports, module) ->
	
	tpl = require 'text!./templates/users.html'
	UserView = require './user_view'
	BaseView = require 'shared/base_view'

	class UsersView extends BaseView
		
		template: _.template tpl
		collection: null
		
		initialize: (options) ->
			if options and options.collection
				@collection = options.collection
			return @

		_getItemsContainer: () ->
			unless @$itemsContainer
				@$itemsContainer = $ 'tbody.items', @$el
			@$itemsContainer

		render: ->
			
			@$el.html @template()
			
			unless @collection
				return @

			@collection.each (user) =>
				userView = new UserView
					model: user
				userView.render()
				@_getItemsContainer().append userView.$el

			return @
