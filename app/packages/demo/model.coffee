define (require, exports, module)->
	exports.Model = class MyModel extends Backbone.Model
		url: '/test'
		defaults:
			username: 'Petro'

		validation:
			'username':
				required: true
				msg: 'Username is required'
			'email': [
				{
					required: true
					msg: 'Email is required'
				}
				{
					pattern: 'email'
					msg: 'Invalid email'
				}
			]
	return