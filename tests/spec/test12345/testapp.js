var expect = chai.expect;

describe('Main', function(){

	it('should save without error Main', function(done){
		var yippee = {};
		expect(yippee).to.be.empty;
		console.log('aaa111');

		requirejs(['app'], function () {
			var t2 = {};
			expect(t2).to.be.a('object');
			console.log('bbbccc111');
			done();
		});
	});
});