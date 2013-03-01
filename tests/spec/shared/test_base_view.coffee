expect = chai.expect

describe 'BaseViewTest', ->
	
	BaseView = null
	
	beforeEach (done) ->
		require ['shared/base_view'], (_BaseView) ->
			BaseView = _BaseView
			done()

	it 'expect that view can be rendered in the DOM', (done) ->
		view = new BaseView
		expect(view).to.be.an 'object'
		for meth in ['render', 'dispose']
			expect(view).to.have.property meth
			expect(view[meth]).to.be.a 'function'
		expect(view.dispose()).to.be.equal view
		done()
