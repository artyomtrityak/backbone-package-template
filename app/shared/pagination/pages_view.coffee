define (require, exports, module) ->

	BaseView = require 'shared/base_view'
	Template = require 'text!shared/pagination/templates/pages.html'

	class PagesView extends BaseView

		className: 'pagination'

		events:
			"click li.active a,li.disabled a": "noop"

		template: _.template Template
		pagesCount: 5
		data: {}

		noop: (e)->
			e.preventDefault()

		initialize: (opts) ->
			@_initBaseRoute()
			@_initAlignment()
			@_initViewData()
			@

		_initBaseRoute: ->
			@baseRoute = @options.baseRoute = @options.baseRoute or ""

		_initAlignment: ->
			if _(['right', 'centered']).contains @options.alignment
				@alignment = @options.alignment

		_initViewData: ->
			@data =
				pageRange: @_getPageRange()
				hasPrev: @collection.currentPage isnt 1
				hasNext: @collection.currentPage isnt @collection.totalPages
				current: @collection.currentPage or 1
				baseRoute: @options.baseRoute.replace /(^\/+)|(\/+$)/g, ""

		_getPageRange: ->
			unless @collection.totalPages is 1
				_.range @_getStartPage(), @_getTopPage()
			else
				[1]

		_getStartPage: ->
			pDiff = @collection.currentPage - @_getHalfPagesCount()
			startPage = if (pDiff) > 1 then pDiff else 1

		_getHalfPagesCount: ->
			Math.floor (@pagesCount - 1) / 2

		_getTopPage: ->
			topPage = @_getStartPage() + @pagesCount
			max = @collection.totalPages + 1
			if topPage > max
				topPage = max
			topPage

		render: ->
			@$el.html @template data: @data
			@$el.addClass "pagination-#{@alignment}"
			@
