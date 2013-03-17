define (require, exports, module)->
	Model = require './model'
	class Friends extends Backbone.Collection
		url: '/getFriends'
		model: Model

		validation:
			'name':
				required: true
				msg: 'Company name is required'
			'url':
				required: true
				msg: 'Company site url is required'