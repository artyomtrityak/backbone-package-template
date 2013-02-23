/*global define: true, _: true, console:true, require: true, Backbone: true, $: true */

define(['exports', 'sinon'], function (exports) {

	exports.start = function () {
		var server = sinon.fakeServer.create();
		server.autoRespond = true;
		server.autoRespondAfter = 50;

		server.respondWith("GET", "/test",
			[200, { "Content-Type": "application/json" },
			'{ "id": 12, "comment": "Hey" }']
		);
	};

});