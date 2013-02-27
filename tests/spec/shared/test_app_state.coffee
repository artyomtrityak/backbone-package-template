expect = chai.expect

describe 'AppStateTest', ->
	
	appState = null

	beforeEach (done) ->
		require ['shared/app_state'], (_appState) ->
			appState = _appState;
			done()

	it 'expect appState should be an object and have listed methods', (done) ->
		expect(appState).to.be.a 'object'
		for meth in ['get', 'set', 'del']
			expect(appState).to.have.property meth
			expect(appState[meth]).to.be.a 'function'
		done()

	it 'expect that appState methods are working correctly', (done) ->

		key = 'foobar'
		val =
			42: 9000
			'hello': 'world'
			undefined: null
		
		expect(appState.get key).to.be.undefined
		appState.set key, val
		expect(appState.get key).to.be.equal val
		
		appState.del key
		expect(appState.get key).to.be.undefined
		done()
