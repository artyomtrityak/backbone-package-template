expect = chai.expect

describe 'Test User View', ->
	UserView = null
	UserModel = null
	usersJson = null
	userObj = null

	beforeEach (done) ->
		UserView = require 'packages/organization/user_view'
		UserModel = require 'packages/organization/user_model'
		usersArr = JSON.parse require 'text!assets/json/users.json'
		userObj = usersArr[0]
		done()

	it 'should export correct view', (done) ->
		expect(UserView).to.be.a 'function'
		done()

	it 'should allow to render template', (done) ->
		view = new UserView
			model: new UserModel userObj
		expect(view).to.have.property 'render'
		expect(view.render).to.be.a 'function'
		expect(view.render()).to.be.equal view
		expect(view.render().$el).to.be.an 'object'
		expect(view.render().$el.html()).to.contain 'Yurij Skalskyy'
		done()
