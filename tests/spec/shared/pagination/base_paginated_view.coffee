expect = chai.expect

describe 'BasePaginatedViewTest', ->
	
	BasePaginatedView = null
	Collection = null
	
	beforeEach (done) ->
		BasePaginatedView = require 'shared/pagination/base_paginated_view'
		Collection = require 'packages/organization/users_collection'
		done()

	it 'expect that view can be rendered in the DOM', (done) ->
		view = new BasePaginatedView
			collection: new Collection
		expect(view).to.be.an 'object'
		for meth in ['render', 'dispose']
			expect(view).to.have.property meth
			expect(view[meth]).to.be.a 'function'
		expect(view.dispose()).to.be.equal view
		expect(view).to.have.property 'pagesView'
		expect(view.pagesView).to.be.an 'object'
		done()
