expect = chai.expect

describe 'View not found test', ->
	View = null

	beforeEach (done) ->
		require ['packages/not-found/view', ''], (_dep) ->
			View = _dep
			done()

	it 'should be a view', ->
		expect(View).to.be.a 'function'

		BaseView = require 'shared/base_view'
		v = new View()
		expect(v instanceof BaseView).to.be.ok

	it 'should render correct data', ->
		Model = require 'packages/not-found/model'

		v = new View model: new Model()
		expect(v.render().$el.html()).to.contain 'Page not found'
