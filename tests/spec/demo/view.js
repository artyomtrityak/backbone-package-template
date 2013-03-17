var expect = chai.expect;

describe('Test', function() {
	var view;
	beforeEach(function (done) {
		require(['packages/demo/view'], function (pView) {
			view = pView;
			done();
		});
	});

	it('expect view should return view', function(done){
		expect(view).to.be.a('function');

		done();
	});

	it('expect view should contain correct template', function (done) {
		var viewIns = new view();
		expect(viewIns instanceof Backbone.View).to.be.ok;
		expect(viewIns).to.have.property('template');
		expect(viewIns.template).to.be.a('function');
		expect(viewIns.template({data: {
			username: 'Lola'
		}})).to.contain("demo template Lola");

		done();
	});

	it('should allow render template', function () {
		var viewIns = new view();
		expect(viewIns).to.have.property('render');
		expect(viewIns.render()).to.be.equal(viewIns);
		expect(viewIns.render().$el).to.be.a('object');
		expect(viewIns.render().$el.html()).to.contain('demo template Artyom');
	});

	it('should allow show notification', function () {
		var viewIns = new view();
		expect(viewIns).to.have.property('showNotification');
		expect(viewIns.showNotification).to.be.a('function');
		expect(viewIns.showNotification()).to.be.a('object');
		expect(viewIns.render().$el.html()).to.contain('Hello, demo!');
	});
});