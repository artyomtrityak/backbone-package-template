# global define: true, _: true, console:true, require: true, Backbone: true, $: true

define (require, exports, module) ->
	require('sinon')
	json =
		users: JSON.parse require 'text!assets/json/users.json'

	exports.start = ->
		server = sinon.fakeServer.create()
		server.autoRespond = on
		server.autoRespondAfter = 50

		_getUsers = ->
			JSON.stringify
				items: json.users
				__count: json.users.length

		requests = [
			{
				method: 'GET'
				route: '/test'
				response: '{"id": 12, "comment": "Hey"}'
			}
			{
				method: 'GET'
				#route: '/organization/users'
				route: /\/organization\/users.*?/
				response: _getUsers()
			}
		]
		for req in requests then do (req) ->
			server.respondWith req.method, req.route, [
				200
				{'Content-Type': 'application/json'}
				req.response
			]

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
