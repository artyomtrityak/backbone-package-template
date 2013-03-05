expect = chai.expect

describe 'Test organization Users collection', ->
	Users = null

	beforeEach (done) ->
		require ['packages/organization/users_collection'], (_Users) ->
			Users = _Users
			done()

	it 'expect that collection fetches the data', (done) ->
		users = new Users
		expect(users).to.be.an 'object'
		expect(users).to.have.a.property 'size'
		expect(users.size).to.be.a 'function'

		users.pager
			success: (_users) ->
				expect(users.size()).to.be.equal 2
				expectedIds = [7, 12]
				for id in expectedIds
					user = users.get(id)
					expect(user).to.be.an 'object'
					expect(user.get('id')).to.be.equal id
				done()
			error: ->
				console.log 'Users FETCH ERROR: ', arguments
