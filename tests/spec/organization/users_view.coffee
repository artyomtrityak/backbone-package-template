expect = chai.expect

describe 'Test User View', ->
	UsersView = null
	UsersCollection = null

	beforeEach (done) ->
		require [
			'packages/organization/users_view',
			'packages/organization/users_collection'], (_UsersView, _UsersCollection) ->
			UsersView = _UsersView
			UsersCollection = _UsersCollection
			done()

	it 'should export correct view', (done) ->
		expect(UsersView).to.be.a 'function'
		done()

	it 'should allow to render template', (done) ->
		collection = new UsersCollection

		view = new UsersView
			collection: collection

		expect(view).to.have.property 'render'
		expect(view.render).to.be.a 'function'
		expect(view.render()).to.be.equal view
		expect(view.render().$el).to.be.an 'object'
		expect(view.render().$el.html()).to.contain(
			'<table class="table table-bordered table-users">'
		)
		done()
