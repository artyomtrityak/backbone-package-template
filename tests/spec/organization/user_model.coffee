expect = chai.expect

describe 'Test organization User model', ->

	User = null

	beforeEach (done) ->
		require ['packages/organization/user_model'], (_User) ->
			User = _User
			done()

	it 'expect that the model fetches the data', (done) ->
		userId = 7
		user = new User
				id: userId
		expect(user).to.be.an 'object'
		expect(user).to.have.property 'fetch'
		expect(user.fetch).to.be.a 'function'
		user.fetch
			success: (u) ->
				expect(u).to.be.an 'object'
				expect(u.get('id')).to.be.equal userId
				done()
			error: (e) ->
				console.log 'User FETCH ERROR: ', e
