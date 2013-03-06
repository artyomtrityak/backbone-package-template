define (require, exports, module) ->
	require 'backbone.paginator'
	User = require './user_model'
	class Users extends Backbone.Paginator.requestPager
		
		model: User
		url: '/organization/users'
		
		paginator_core:
			type: 'GET'
			dataType: 'json'
			url: '/organization/users'

		paginator_ui:
			firstPage: 1
			currentPage: 1
			perPage: 10
			totalPages: 10

		server_api:
			$filter: ''

			$top: ->
				return @perPage

			$skip: ->
				return (@currentPage - 1) * @perPage

			$orderby: ->
				if @sortField is undefined
					return 'ReleaseYear'
				return @sortField

			$format: 'json'

			# Custom parameters
			$inlinecount: 'allpages'
			# $callback: '?'

		parse: (response) ->
			items = response.items
			@totalPages = Math.ceil response.__count / @perPage
			@totalRecords = parseInt response.__count
			return items
