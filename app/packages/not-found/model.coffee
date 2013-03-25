define (require, exports, module)->
	
	class Model extends Backbone.Model
		defaults:
			error: 'Sorry...'
