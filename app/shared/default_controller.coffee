define (require, exports, module) ->
	
	class Controller
		constructor: ->
			console.log "aa"

		beforeRequest: ->
			console.log "before"

		destructor: ->
			console.log "destructor2"

