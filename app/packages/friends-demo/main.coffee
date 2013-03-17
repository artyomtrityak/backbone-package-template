define (require, exports, module)->
	View = require './collectionView'
	Collection = require './collection'
	BaseController = require 'shared/base_controller'

	class Controller extends BaseController
		routes:
			'friends': 'friends'

		friends: ->
			@currentView = new View
				collection: new Collection()
			$('#demo-box').html @currentView.render().$el
			return @
