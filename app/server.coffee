# global define: true, _: true, console:true, require: true, Backbone: true, $: true

define (require, exports, module) ->
	require('sinon')

	_buildResponse = (content, status = 200) ->
		[
			status
			'Content-Type': 'application/json'
			content
		]

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
			{
				method: 'GET',
				route: '/getFriends'
				response: '[{"id":1, "name": "Acme 1",  "url": "http://acme1.com", "logoSrc":"/assets/img/mock_img.png"},{"id":2, "name": "Acme 2",  "url": "http://acme2.com", "logoSrc":"/assets/img/mock_img.png"},{"id":3, "name": "Acme 3",  "url": "http://acme3.com", "logoSrc":"/assets/img/mock_img.png"}]'
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
