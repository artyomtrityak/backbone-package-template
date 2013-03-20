expect = chai.expect

describe 'Application test', ->

	beforeEach (done) ->
		require ['packages/demo'], (_app) ->
			app = _app
			done()

	it 'should exports correct app', (done) ->
		
		expect(true).to.be.a 'boolean'

		expect(Backbone).to.be.a('object')
		done()
		