define (require, exports, module)->
	exports.Model = Backbone.Model.extend(
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
	)
	return