var expect = chai.expect;

describe('Test', function() {
	var model, view;
	beforeEach(function (done) {
		require(['packages/demo/model', 'packages/demo/view'],
			function (pModel, pView) {
			model = pModel;
			view = pView;
			done();
		});
	});

	it('should be correct model', function () {
		expect(model).to.be.a('object');
		expect(model.Model).to.be.a('function');
		expect((new model.Model()) instanceof Backbone.Model).to.be.ok;
	});

	it('should have corrent defaults', function () {
		var modelIns = new model.Model();
		expect(modelIns.defaults).to.be.deep.equal({
			username: 'Petro'
		});
	});

	it('should have corrent url and be able to fetch', function (done) {
		var modelIns = new model.Model();
		expect(modelIns.url).to.be.equal("/test");
		var m = new model.Model();
		var viewIns = new view.View({
			model: m
		});

		viewIns.model.set('email', 'aaaa');
		expect(m.validate()).to.be.a('object');
		viewIns.model.set('email', 'aaaa@aaa.cc');
		expect(m.validate()).to.be.equal(undefined);


		modelIns.fetch({
			success: function () {
				expect(modelIns.get('id')).to.be.equal(12);
				expect(modelIns.get('comment')).to.be.equal('Hey');
				expect(modelIns.get('username')).to.be.equal('Petro');
				done();
			}
		});

		
	});
});