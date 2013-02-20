/*global define: true, _: true, console:true, require: true, Backbone: true, $: true */

define(function (require, exports, module) {
	"use strict";

	var demoPackage = require('packages/demo'),
			Utils = require('utils/utils'),
			packages = Utils.getPackagesRoutes([
				demoPackage.Controller
			]);


	if (module.config().dev) {
		var server = require('server');
		server.start();
	}

	exports.App = Backbone.Router.extend(_.extend({},
		packages.methods,
		{
			routes: _.extend({},
				packages.routes,
				{
					'*other': 'unknownRoute'
				}
			),

			unknownRoute: function () {
				console.log('unknown');
			}
		}
	));
});