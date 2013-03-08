expect = chai.expect


describe 'Test users controller', ->
	dep = null

	beforeEach (done) ->
		require ['packages/organization'], (_dep) ->
			dep = _dep
			done()

	it 'should export correct controller', ->
		expect(dep.Controller).to.be.a 'function'

	it 'should have correct routes', ->
		cnt = new dep.Controller()
		expect(cnt.routes).to.be.a 'object'
		expect(cnt.routes).to.be.deep.equal {
			'organization': 'showUsersList'
			'organization/users(/p/:page)': 'showUsersList'
			'organization/users/add': 'addUser'
			'organization/users/:id': 'showUserDetails'
		}

		expect(cnt).to.have.property 'showUsersList'
		expect(cnt).to.have.property 'addUser'
		expect(cnt).to.have.property 'showUserDetails'
