/*global define: true, _: true, console:true, require: true, Backbone: true, $: true */

define(['exports', 'module', 'server'], function (exports, module, server) {
	"use strict";

	if (module.config().dev) {
		server.start();
	}

	exports.App = Backbone.Router.extend({
		routes: {
			'*other': 'unknownRoute'
		},

		unknownRoute: function () {
			
		}
	});
});