define (require, exports, module) ->
	User = require './user_model'

	class Users extends Backbone.Collection
		model: User
		url: '/organization/users'
