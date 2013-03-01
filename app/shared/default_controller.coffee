define (require, exports, module) ->
	
	class Controller
		constructor: ->

		onBeforeRequest: ->
			console.log "before"
			console.log arguments

		onAfterRequest: ->
			console.log 'after'
			console.log arguments

		destructor: ->
			console.log "destructor"



