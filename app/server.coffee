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

	getQuerySringParams = (url) ->
		params  = {}
		url = decodeURIComponent url.replace /\+/g, ' '
		queryString = url.replace /^.*?\?/, ''
		pairs = queryString.split '&'
		for pair in pairs
			key = pair.split '='
			if key.length > 1
				params[key[0]] = key[1]
		return params

	exports.start = ->
		server = sinon.fakeServer.create()
		server.autoRespond = on
		server.autoRespondAfter = 50

		_getUser = (xhr, id) ->
			user = null
			id = parseInt id
			user = _(json.users).findWhere {id: id}
			if user
				data = user
				status = 200
			else
				data = {error: 'User not found'}
				status = 404
			response = _buildResponse JSON.stringify(data), status
			xhr.respond.apply xhr, response

		_getUsers = (xhr, queryString) ->
			params = getQuerySringParams xhr.url
			items = json.users.concat (_createUser id for id in [20..100])
			skip = parseInt(params.$skip) or 0
			pageSize = parseInt(params.$top) or items.length
			data = JSON.stringify
				items: items.slice skip, skip + pageSize
				__count: items.length
			response = _buildResponse data
			xhr.respond.apply xhr, response

		_randBool = () ->
			!!_.random 0, 1

		_createUser = (id) ->
			index = if _randBool() then 1 else 0
			_.extend {}, json.users[index],
				id: id
				status: if _randBool() then 'ADMIN' else 'INVITED'
				tout_settings:
					if _randBool()
					then 'AUTO_PUBLISH'
					else 'MODERATE TOUTS'

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
			{
				method: 'GET'
				route: /\/organization\/user\/(\d+)/
				response: _getUser
			}
		]

		for req in requests then do (req) ->
			if _.isFunction req.response
				response = req.response
			else
				response = _buildResponse req.response
			server.respondWith req.method, req.route, response

		return
	return
