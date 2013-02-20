var expect = chai.expect;

describe('Application', function() {
	var app;

	beforeEach(function (done) {
		require(['app'], function (pApp) {
			app = pApp;
			done();
		});
	});

	it('should exports correct app', function(done){

			expect(app).to.be.a('object');
			
			expect(app.App).to.be.a('function');

			var Application = new app.App();
			expect(Application).to.have.property('routes');
			expect(Application).to.have.property('unknownRoute');

			done();
	});

});