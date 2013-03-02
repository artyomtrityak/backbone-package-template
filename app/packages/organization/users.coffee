define (require, exports, module) ->
	User = require './user'

	class Users extends Backbone.Collection
		model: User
		url: '/organization/users'
