define (require, exports, module) ->

	UsersView = require './users_view'
	UsersCollection = require './users_collection'
	BaseController = require 'shared/base_controller'

	exports.Controller = class Controller extends BaseController

		routes:
			'organization': 'showUsersList'
			'organization/users(/p/:page)': 'showUsersList'
			'organization/users/add': 'addUser'
			'organization/users/:id': 'showUserDetails'

		showUsersList: (page)->
			page = parseInt(page) or 1
			console.log 'show list'
			users = new UsersCollection
			users.goTo page,
				success: @_renderUsers
			return users

		_renderUsers: (users) ->
			@currentView = new UsersView
				collection: users
				alignment: 'centered'
				baseRoute: 'organization/users'

			$('#demo-box').html @currentView.render().$el
			return @currentView

		addUser: ->
			console.log 'add user'

		showUserDetails: (userId) ->
			console.log 'show details'
			console.log userId

	return
