expect = chai.expect

describe 'Model not found test', ->
	Model = null

	beforeEach (done) ->
		require ['packages/not-found/model'], (_dep) ->
			Model = _dep
			done()

	it 'should be a model', ->
		expect(Model).to.be.a 'function'

		m = new Model()
		expect(m instanceof Backbone.Model).to.be.ok

	it 'should have correct data', ->
		m = new Model()
		expect(m.defaults).to.be.a 'object'
		expect(m.defaults).to.be.deep.equal {error: 'Sorry...'}

		
