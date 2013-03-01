expect = chai.expect

describe "Test default controller", ->
	s = {}
	beforeEach (done) ->
		require ['shared/default_controller'], (_Cont)->
			s.Cont = _Cont
			done()

	it 'should contain controller methods', ->
		expect(s.Cont).to.be.a 'function'

		contIns = new s.Cont
		expect(contIns).to.have.property 'onBeforeRequest'
		expect(contIns).to.have.property 'onAfterRequest'
		expect(contIns).to.have.property 'destructor'

