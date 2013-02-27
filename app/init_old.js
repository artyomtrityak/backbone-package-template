/*global define: true, _: true, console:true, require: true, Backbone: true, $: true */

require(['app'], function (Application) {
	var app = new Application.App();
	
	Backbone.history.start();
});