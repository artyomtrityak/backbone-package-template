# global define: true, _: true, console:true, require: true, Backbone: true, $: true

define ->

	state = {}

	get: (key) ->
		state[key]

	set: (key, val) ->
		state[key] = val

	delete: (key) ->
		delete state[key]
