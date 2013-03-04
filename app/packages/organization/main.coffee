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
			view = null
			users = new UsersCollection
			users.fetch
				success: @_renderUsers
			return users

		_renderUsers: (users) ->
			view = new UsersView
				collection: users
			$('#demo-box').html view.render().$el

			return view

		addUser: ->
			console.log 'add user'

		showUserDetails: (userId) ->
			console.log 'show details'
			console.log userId

	return
