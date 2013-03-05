#Template for package style Backbone.js applications 

[![Build Status](https://travis-ci.org/artyomtrityak/backbone-package-template.png)](https://travis-ci.org/artyomtrityak/backbone-package-template)

#What is this?

This is __not__ framework. It's just Backbone.js + Require.js + CoffeeScript application structure.

The most cool thing in Backbone.js that it's very easy. You can read docs 1 day and you're ready to start.
It's awersome! 

The main idea of this structure that you don't need learn any new framework. You can clone this project and start develop your Backbone.js application.

## Benefits

- It's well structured and uses most modern practices: Require.js as module loader, unit-testing (mocha + chai + testacular), coffeescript. 

- It uses packages (widgets) structure so can be easy supported for big amd small projects.

- It's tested. Project has unit-tests which covers it's functionality. Each master update is autotesting by Travis CI

- It's configured. Auto-compication coffee, sass (scss), run unittests in terminal (in real browsers or phantomjs) on each file save. It's done. It's work. You don't need spend time for configuration. Just take and use.

- It's free and opensourse. If you have some idea how to improve this structure you can just make pull request. Issues can be created if you don't know how it will be better to solve problem and me or someone else will be able to help.


# Structure

## app

This folder contains all your files except unit-tests and generators

### assets

Folder for html, images, css (and sass / scss) and external libs

To start application you can just view `localhost:8080/assets/index.html` file which contains Require.js project load

```html
<script type="text/javascript" src="/assets/js/require-2.1.4.js"></script>
<script type="text/javascript" src="/config.js"></script> 
<script type="text/javascript" src="/init.js"></script> 
```


### packages

This is the place for your packages. It contains folders with packages names. 

For adding new package you can use generators.
For example: `node_modules/.bin/brunch generate package my-package-name`. This command will create `my-package-name` folder and packages and in tests.

If you don't want to use generators you can just create folder with `main.coffee` file.

Also you need to add your package to Require.js config `packages: ['packages/demo', 'packages/organization', 'packages/my-package-name']`.

That's all. You have new package which can be loaded by `pkg = require 'packages/my-package-name'` call. Require.js automatically loads `main.coffee` file on package folder include. Details docs: http://requirejs.org/docs/api.html#packages


#### packages/my-package-name/main.coffee

It should contain Controller which provides simple urls for package routing. It should extends from base controller to allow auto-dispose if it needed.

For example:

```coffeescript
define (require, exports, module)->
	view = require './view'
	model = require './model'
	BaseController = require 'shared/base_controller'

	exports.Controller = class Controller extends BaseController
		routes:
			'demo': 'demo'
			'demo/:id': 'demo'

		demo: ->
			@currentView = new view.View(
				model: new model.Model()
			)
			$('#demo-box').html @currentView.render().$el
			return @
	return
```

What's happens here? We load `view.coffee` and `model.coffee` files from current package folder, load `base_controller.coffee` file from shared folder and create own package controller which extends from BaseCntroller. `routes` attr will be bind by `Backbone.Router.route` function.

Files `view.coffee` and `model.coffee` is not required. You can create any files you need and load what you need. It's just example.

Also controller 3 methods are colling during request (you can see how it was done in `shared/utils.coffee` file):

- `onBeforeRequest`

- your route method, for example `demo`

- `onAfterRequest`


### shared

This folder contains global modules. Anything global you need should be placed here.

#### shared/app_state.coffee

This is simple app-level object which can save any global variables and objects you need.

Usage:

```coffeescript
appState = require 'shared/app_state'

prevController = appState.get 'prevController'

appState.set 'prevController', @
```

#### shared/base_controller.coffee

It is small base controller which makes default things like dispose prev controller when we route to new controller 

```coffeescript
onBeforeRequest: ->
	prevController = appState.get 'prevController'

	if prevController? and prevController != @
		prevController.destructor()
```


or dispose view on change route. 

```coffeescript
onBeforeRequest: ->
	if @currentView?
		@currentView.dispose()
		@currentView = null
```

If  you don't need it you can just don't extend from default controller.


#### shared/base_view.coffee

This is empty base view. If you need some default view functionality you can place it here


#### shared/mediator.coffee

This is simple pub/sub app level object for events binding

```coffeescript
define ->
	_.extend {}, Backbone.Events
```


#### shared/utils.coffee

This module contains `bindRoutes` function which binds your routes from controller to Backbone.Router and calls `onBeforeRequest` and `onAfterRequest`


```coffeescript
	pkg.onBeforeRequest.apply pkg, argsWithDetails
	pkg[method].apply pkg, arguments
	pkg.onAfterRequest.apply pkg, argsWithDetails
```

### app.coffee

This is main application file. Here we create Backbone.Router and bind all packages.

```coffeescript
Utils.bindRoutes @, [
				demoPackage.Controller
				orgPackage.Controller
			]
```


### config.coffee

There is Require.js config here


### init.coffee

Simple project start file.


### server.coffee
It's sinon.js fake server which mocks `xhr` and allow us use any ajax requests without real ajax requests.
So we will make request with for example `model.fetch()` but response will be given from fake server without any real ajax.

This is needed if you develop frontend without ready backend. Backend devs will give you json / xml which their server will respond and you will set it in `server.coffee`



## tests
This is folder which contains your unit-tests


### tests/spec
`tests/spec` folder has same structure as app folder and contains unittests which 


### tests/testacular-config.coffee
It's config for test runner


`note: when i write that it loads .coffee file i mean conpiled .js file`



# Requirements

- install ruby
- __gem install sass__





# Installation

I recommend use __brunch__ for creating new project. Also it allows use Backbone Package generators

- __npm -g install brunch__

- __brunch new your_project_folder github://artyomtrityak/backbone-package-template__

- open __http://localhost:8080__

# Command line

- __npm install__ for install deps

- __npm start__ for running grunt server: coffee, scss processing, static files serving and testacular tests

- __npm test__ for running tests once

- __node_modules/.bin/brunch generate package your_package_name__ for generating package and tests for it





#TODO:

- remove brunch and use single libs