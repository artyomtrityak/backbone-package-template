expect = chai.expect

describe 'Test User View', ->
	UsersView = null

	beforeEach (done) ->
		require ['packages/organization/users_view'], (_UsersView) ->
			UsersView = _UsersView
			done()

	it 'should export correct view', (done) ->
		expect(UsersView).to.be.a 'function'
		done()

	it 'should allow to render template', (done) ->
		view = new UsersView;
		expect(view).to.have.property 'render'
		expect(view.render).to.be.a 'function'
		expect(view.render()).to.be.equal view
		expect(view.render().$el).to.be.an 'object'
		expect(view.render().$el.html()).to.contain(
			'<table class="table table-bordered table-users">'
		)
		done()
