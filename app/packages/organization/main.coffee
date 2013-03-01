define (require, exports, module) ->
	view = require './view'
	model = require './model'
	BaseController = require 'shared/base_controller'

	exports.Controller = class Controller extends BaseController

		routes:
			'organization': 'showUsersList'
			'organization/users': 'showUsersList'
			'organization/users/add': 'addUser'
			'organization/users/:id': 'showUserDetails'

		showUsersList: ->
			console.log 'show list'

		addUser: ->
			console.log 'add user'

		showUserDetails: (userId) ->
			console.log 'show details'
			console.log userId

	return