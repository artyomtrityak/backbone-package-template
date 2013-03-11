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
		expect(view).to.have.property 'baseRoute'
		expect(view.baseRoute).to.be.equal 'some/route'
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

	_loadCollection = (page = 3, baseRoute = 'test/route', options = {}) ->
		collection = new UsersCollection()
		baseRoute = 'test/route'
		collection.goTo page,
			success: ->
				view = new PagesView
					collection: collection
					baseRoute: baseRoute
				if options.success
					options.success.call @, view, collection, page, baseRoute
			error: ->
				console.log "Can't reach the page ##{page}.", arguments
				if options.error
					options.error.call @, view, collection, page, baseRoute

	testViewData = (view, expectedPageRange, expectedHasPrev,
			expectedHasNext, expectedCurrent, expectedBaseRoute) ->
		expect(view.data.pageRange).to.be.eql expectedPageRange
		expect(view.data.hasPrev).to.be.equal expectedHasPrev
		expect(view.data.hasNext).to.be.equal expectedHasNext
		expect(view.data.current).to.be.equal expectedCurrent
		expect(view.data.baseRoute).to.be.equal expectedBaseRoute

	it 'expect correct pagination properties', (done) ->
		_loadCollection 3, 'test/route', 
			success: (view, collection, page, baseRoute) ->
				testViewData view, [1..5], yes, yes, page, baseRoute
				done()		

	it 'expect correct pagination properties for first page', (done) ->
		_loadCollection 1, 'test/route',
			success: (view, collection, page, baseRoute) ->
				testViewData view, [1..5], no, yes, page, baseRoute
				done()

	it 'expect correct pagination properties for last page', (done) ->
		_loadCollection 9, 'test/route',
			success: (view, collection, page, baseRoute) ->
				testViewData view, [7..9], yes, no, page, baseRoute
				done()

	it 'expect correct pagination properties for middle page', (done) ->
		_loadCollection 6, 'test/route',
			success: (view, collection, page, baseRoute) ->
				testViewData view, [4..8], yes, yes, page, baseRoute
				done()
