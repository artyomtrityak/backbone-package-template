define (require, exports, module) ->

	BaseView = require 'shared/base_view'
	Template = require 'text!shared/templates/pages.html'

	class PageView extends BaseView

		tagName: 'div'
		className: 'pagination'

		events:
			"click li.active a,li.disabled a": "noop"

		template: _.template Template
		pagesCount: 5
		data: {}

		noop: (e)->
			e.preventDefault()

		initialize: (opts) ->
			cp = @collection.currentPage
			tp = @collection.totalPages
			pc = @pagesCount
			opts.baseRoute = opts.baseRoute or ""

			if _(['right', 'centered']).indexOf(opts.alignment) isnt -1
				@alignment = opts.alignment

			# halfPagesCount
			hpc = Math.floor (pc - 1) / 2 

			# startPage
			sp = if (cp - hpc) > 1 then cp - hpc else 1 

			# toPage
			top = if (sp + pc) > (tp + 1) then (tp + 1) else sp + pc

			@data =
				pageRange: if tp isnt 1 then _.range sp, top else [1]
				hasPrev: cp isnt 1
				hasNext: cp isnt tp
				current: cp
				baseRoute: opts.baseRoute.replace /(^\/+)|(\/+$)/g, ""

			@

		render: -> 
			@$el.html @template({ data: @data })

			@$el.addClass "pagination-#{@alignment}"
			@