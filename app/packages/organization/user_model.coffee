define (require, exports, module) ->
	class User extends Backbone.Model
		urlRoot: '/organization/user'
