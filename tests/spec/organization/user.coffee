expect = chai.expect

describe 'Test organization User model', ->
	dep = null

	User = null

	beforeEach (done) ->
		require ['packages/organization/user'], (_User) ->
			User = _User
			done()

	it 'expect that the model fetches the data', (done) ->
		user_id = 7
		user = new User
				id: user_id
		expect(user).to.be.an 'object'
		expect(user).to.have.property 'fetch'
		expect(user.fetch).to.be.a 'function'
		user.fetch
			success: (u) ->
				expect(u).to.be.an 'object'
				expect(u.get('id')).to.be.equal user_id
				done()
			error: (e) ->
				console.log 'User FETCH ERROR: ', e
