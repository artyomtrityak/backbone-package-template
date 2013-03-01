define (require, exports, module) ->
	
	class Controller
		constructor: ->

		beforeRequest: ->
			console.log "before"

		afterRequest: ->
			console.log 'after'

		destructor: ->
			console.log "destructor2"



