define (require, exports, module) ->

	BaseView = require 'shared/base_view'
	PagesView = require 'shared/pages_view'

	class BasePaginationView extends BaseView

		pageView: null

		initialize: (opts) ->
			@pageView = new PagesView opts
			@

		dispose: ->
			@pageView.remove()
			super