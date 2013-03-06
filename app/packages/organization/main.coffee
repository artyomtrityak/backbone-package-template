define (require, exports, module) ->

	UsersView = require './users_view'
	UsersCollection = require './users_collection'
	BaseController = require 'shared/base_controller'

	exports.Controller = class Controller extends BaseController

		routes:
			'organization': 'showUsersList'
			'organization/users': 'showUsersList'
			'organization/users/add': 'addUser'
			'organization/users/:id': 'showUserDetails'

		showUsersList: ->
			console.log 'show list'
			users = new UsersCollection
			users.goTo 1,
				success: @_renderUsers
			return users

		_renderUsers: (users) ->
			@currentView = new UsersView
				collection: users
			$('#demo-box').html @currentView.render().$el
			return @currentView

		addUser: ->
			console.log 'add user'

		showUserDetails: (userId) ->
			console.log 'show details'
			console.log userId

	return
