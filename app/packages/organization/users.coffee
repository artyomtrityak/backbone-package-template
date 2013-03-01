define (require, exports, module) ->
	User = require './user'

	Backbone.Collection.extend
		model: User
		url: '/organization/users'
