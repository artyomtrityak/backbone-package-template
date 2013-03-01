# global define: true, _: true, console:true, require: true, Backbone: true, $: true

define (require, exports, module) ->
	require('sinon')
	exports.start = ->
		server = sinon.fakeServer.create()
		server.autoRespond = on
		server.autoRespondAfter = 50
		requests = [
			{
				method: 'GET'
				route: '/test'
				response: '{"id": 12, "comment": "Hey"}'
			}
		]
		for req in requests then do (req) ->
			server.respondWith req.method, req.route, [
				200
				{'Content-Type': 'application/json'}
				req.response
			]
		return
	return
