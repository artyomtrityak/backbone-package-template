expect = chai.expect

describe 'Application test', ->
	app = null

	beforeEach (done) ->
		require ['app'], (_app) ->
			app = _app
			done()

	it 'should exports correct app', (done) ->
		expect(app).to.be.a 'function'

		App = new app()
		done()
		