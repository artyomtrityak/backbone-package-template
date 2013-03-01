expect = chai.expect

describe 'Application test', ->
	app = null

	beforeEach (done) ->
		require ['app'], (_app) ->
			app = _app
			done()

	it 'should exports correct app', (done) ->
		expect(app).to.be.a 'object'

		expect(app.App).to.be.a 'function'

		App = new app.App()
		expect(App).to.have.property 'routes'
		expect(App).to.have.property 'unknownRoute'
		expect(App.unknownRoute).to.be.a 'function'
		done()
		