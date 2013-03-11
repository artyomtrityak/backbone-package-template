define (require, exports, module) ->

	BaseView = require 'shared/base_view'
	PagesView = require 'shared/pagination/pages_view'

	class BasePaginatedView extends BaseView

		pagesView: null

		initialize: (opts) ->
			@pagesView = new PagesView opts
			@

		dispose: ->
			@pagesView.remove()
			super
