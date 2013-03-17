define (require, exports, module)->

	View = require './view'
	BaseView = require 'shared/base_view'

	class CollectionView extends BaseView

		render: ->
			@$el = $("<ul class='thumbnails'></ul>")
			@collection.fetch success: =>
				for model in @collection.models
					friend = @collection.get model
					_view = new View model:friend
					@$el.append(_view.render().$el)
				return @
			return @