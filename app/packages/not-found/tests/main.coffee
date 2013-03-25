expect = chai.expect

describe 'Main Not Found test', ->
	Controller = null

	beforeEach (done) ->
		require ['packages/not-found'], (_dep) ->
			Controller = _dep
			done()

	it 'should be a controller', ->
		expect(Controller).to.be.a 'function'

		BaseController = require 'shared/base_controller'
		c = new Controller()
		expect(c instanceof BaseController).to.be.ok

	it 'should have not found route', ->
		c = new Controller()

		expect(c.notFoundRoute).to.be.a 'function'
		expect(c.routes).to.be.deep.equal {'*other': 'notFoundRoute'}