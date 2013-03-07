expect = chai.expect

describe 'BasePaginatedViewTest', ->
	
	PagesView = null
	UsersCollection = null
	
	beforeEach (done) ->
		PagesView = require 'shared/pagination/pages_view'
		UsersCollection = require 'packages/organization/users_collection'
		done()

	it 'expect that view can be rendered in the DOM', (done) ->
		collection = new UsersCollection()
		view = new PagesView
			collection: collection
			baseRoute: 'some/route'
		expect(view).to.be.an 'object'
		for meth in ['render', 'dispose']
			expect(view).to.have.property meth
			expect(view[meth]).to.be.a 'function'
		expect(view.dispose()).to.be.equal view
		expect(view).to.have.property 'baseRoute'
		expect(view.baseRoute).to.be.a 'string'
		expect(view).to.have.property 'data'
		expect(view.data).to.be.an 'object'
		viewDataProperties = [
			'pageRange'
			'hasPrev'
			'hasNext'
			'current'
			'baseRoute'
		]
		for prop in viewDataProperties
			expect(view.data).to.have.property prop
		done()
