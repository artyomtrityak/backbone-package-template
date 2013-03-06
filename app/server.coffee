# global define: true, _: true, console:true, require: true, Backbone: true, $: true

define (require, exports, module) ->
	require('sinon')
	json =
		users: JSON.parse require 'text!assets/json/users.json'

	_buildResponse = (content, status = 200) ->
		[
			status
			'Content-Type': 'application/json'
			content
		]

	getQueryStringParam = (url, key) ->
		key = key.replace /[*+?^$.\[\]{}()|\\\/]/g, '\\$&'
		match = url.match new RegExp '[?&]' + key + '=([^&]+)(&|$)'
		return match && decodeURIComponent match[1].replace /\+/g, ' '

	exports.start = ->
		server = sinon.fakeServer.create()
		server.autoRespond = on
		server.autoRespondAfter = 50

		_getUser = (xhr, id) ->
			user = null
			id = parseInt id
			user = _(json.users).findWhere {id: id}
			if user
				data = _buildResponse JSON.stringify user
				status = 200
				response = _buildResponse data, status
			else
				data = '{"error": "User not found"}'
				status = 400
				response = _buildResponse data, status
			xhr.respond.apply xhr, response

		_randBool = ->
			parseInt(Math.random() * 100) % 2 > 0

		createUser = (id) ->
			index = if _randBool() then 1 else 0
			_.extend {}, json.users[index],
				id: id
				status: if _randBool() then 'ADMIN' else 'INVITED'
				tout_settings:
					if _randBool()
					then 'AUTO_PUBLISH'
					else 'MODERATE TOUTS'

		_getUsers = (xhr, queryString) ->
			console.log 'xhr :::: ', xhr
			console.log 'query string :::: ', queryString
			_intParam = (key) ->
				parseInt getQueryStringParam xhr.url, key
			items = json.users.concat (createUser id for id in [20..100])
			skip = _intParam('$skip') or 0
			pageSize = _intParam('$top') or items.length
			data = JSON.stringify
				items: items.slice skip, skip + pageSize
				__count: items.length
			response = _buildResponse data
			xhr.respond.apply xhr, response

		requests = [
			{
				method: 'GET'
				route: '/test'
				response: '{"id": 12, "comment": "Hey"}'
			}
			{
				method: 'GET'
				route: /\/organization\/users(\?.*?)?$/
				response: _getUsers
			}
		]
		for req in requests then do (req) ->
			if _.isFunction req.response
				response = req.response
			else
				response = _buildResponse req.response
			server.respondWith req.method, req.route, response

		server.respondWith 'GET', /\/organization\/user\/(\d+)/, (xhr, id) ->
			user = null
			id = parseInt id
			user = _(json.users).findWhere {id: id}
			if user
				xhr.respond 200,
					"Content-Type": "application/json",
					JSON.stringify(user)
			else
				xhr.respond 404,
					"Content-Type": "application/json",
					'{"error": "User not found"}'
		return
	return
