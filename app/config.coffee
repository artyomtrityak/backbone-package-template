require.config {
	baseUrl: '/',

	urlArgs: 'v'+(Date.now()),

	config: {
		'app': {
			'fakeServer': true
		}
	},

	shim: {
		'backbone': {
			deps: ['jquery', 'underscore'],
			exports: 'Backbone'
		},
		'underscore': {
			exports: '_'
		},
		'bootstrap': ['jquery'],
		'backbone.validation': ['backbone'],
		'backbone.routefilter': ['backbone'],
		'app': [
			'text',
			'backbone.validation',
			'backbone.routefilter',
			'bootstrap'
		]
	},

	paths: {
		'text': 'assets/js/text',
		'backbone': 'assets/js/backbone-0.9.10',
		'underscore': 'assets/js/underscore-1.4.4',
		'jquery': 'assets/js/jquery-1.9.1',
		'backbone.validation': 'assets/js/backbone.validation',
		'backbone.routefilter': 'assets/js/backbone.routefilter',
		'bootstrap': 'assets/js/bootstrap',
		'handlebars': 'assets/js/handlebars',
		'sinon': 'assets/js/sinon-1.5.2'
	},

	packages: ['packages/demo']
}