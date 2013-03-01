expect = chai.expect

describe "Test default controller", ->
	s = {}
	beforeEach (done) ->
		require [
			'shared/base_controller'
		 	'shared/app_state'
		], (_Cont, _app_state)->
			s.Cont = _Cont
			s.app_state = _app_state
			s.app_state.del 'prevController'
			done()

	it 'should contain controller methods', ->
		expect(s.Cont).to.be.a 'function'

		contIns = new s.Cont
		expect(contIns).to.have.property 'onBeforeRequest'
		expect(contIns).to.have.property 'onAfterRequest'
		expect(contIns).to.have.property 'destructor'

	it 'should save last controller', ->
		expect(s.app_state.get 'prevController').to.be.undefined

		contIns = new s.Cont()
		contIns2 = new s.Cont()
		contIns.onBeforeRequest()
		expect(s.app_state.get 'prevController').to.be.equal(contIns)		
		expect(s.app_state.get 'prevController').to.not.be.equal(contIns2)		

	it 'should call prev destructor on change controller', ->
		oldIns = new s.Cont()
		newIns = new s.Cont()

		oldIns.onBeforeRequest()
		oldIns.destructor = sinon.spy()

		newIns.onBeforeRequest()
		newIns.destructor = sinon.spy()
		newIns.onBeforeRequest()
		expect(oldIns.destructor.callCount).to.be.equals 1
		expect(newIns.destructor.callCount).to.be.equals 0

	it 'should dispose currentView', ->
		ins = new s.Cont()
		expect(ins).to.have.property 'currentView'
		expect(ins.currentView).to.be.null

		view1 = {
			dispose: sinon.spy()
		}

		ins.currentView = view1
		ins.onBeforeRequest()
		expect(ins.currentView).to.be.null
		expect(view1.dispose.callCount).to.be.equals 1









