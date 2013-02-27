# global define: true, _: true, console:true, require: true, Backbone: true, $: true

define ->

	state = {}

	get: (key) ->
		state[key]

	set: (key, val) ->
		state[key] = val

	del: (key) ->
		delete state[key]
