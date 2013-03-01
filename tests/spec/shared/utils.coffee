expect = chai.expect

describe 'Utils', ->
	g = {}

	beforeEach (done)->
		require ['shared/utils'], (_utils)->
			g.utils = _utils
			done()

	it 'Should export correct utils', (done)->
		expect(g.utils).to.be.a 'object'
		expect(g.utils.bindRoutes).to.be.a 'function'
		done()

	it 'Should bind routes corect', ->
		func = ->
			'ok'

		class R1
			routes: 
				'test555': 'test5'
				'test5551': 'test51'
			test5: func
			test51: func

		class R2
			routes: 
				'test666': 'test6'
			test6: func

		Router = 
			route: sinon.spy()

		g.utils.bindRoutes Router, [R1, R2]

		expect(Router.route.callCount).to.be.equals 3

		expect(Router.route.calledWithMatch 'test555', 'test5').to.be.ok
		expect(Router.route.calledWithMatch 'test666', 'test6').to.be.ok
		expect(Router.route.calledWithMatch 'test5551', 'test51').to.be.ok




