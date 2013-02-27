require ['app'], (Application)->
	app = new Application.App()

	Backbone.history.start()