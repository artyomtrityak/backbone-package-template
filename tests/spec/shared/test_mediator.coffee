expect = chai.expect

describe 'MediatorTest', ->
	
	mediator = null

	beforeEach (done) ->
		require ['shared/mediator'], (_mediator) ->
			mediator = _mediator;
			done()

	it 'expect that mediator is an object and has listed methods', (done) ->
		expect(mediator).to.be.a 'object'
		for meth in ['on', 'off', 'trigger']
			expect(mediator).to.have.property meth
			expect(mediator[meth]).to.be.a 'function'
		done()

	it 'expect that mediator is able to trigger and handle events', (done) ->
		eventData = {foo: 'bar'}
		mediator.on 'test:event', (data) ->
			expect(data).to.be.equal(eventData)
			done()
		mediator.trigger 'test:event', eventData
