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
				expect(users.size()).to.be.equal 10
				expectedIds = [7, 12, 27]
				for id in expectedIds
					user = users.get(id)
					expect(user).to.be.an 'object'
					expect(user.get('id')).to.be.equal id
				paginationProperties = [
					'firstPage'
					'currentPage'
					'perPage'
					'totalPages'
				]
				for prop in paginationProperties
					expect(users).to.have.a.property prop
				done()
			error: ->
				console.log 'Users FETCH ERROR: ', arguments
