define (require, exports, module)->
	class Friend extends Backbone.Model
		url: '/getFriend'
		defaults:
			name: 'Acme Company'
			url : 'www.acme.com'
			logoSrc : '/assets/img/mock_img.png'

		validation:
			'name':
				required: true
				msg: 'Company name is required'
			'url':
				required: true
				msg: 'Company site url is required'