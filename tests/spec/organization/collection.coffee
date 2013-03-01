expect = chai.expect

describe 'Test', ->
	dep = null

	beforeEach (done) ->
		require [], (_dep) ->
			dep = _dep
			done()

	it 'should be test', (done) ->
		done()