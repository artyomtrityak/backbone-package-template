var expect = chai.expect;

describe('Utils', function() {
	var utils;

	beforeEach(function (done) {
		require(['utils/utils'], function (pUtils) {
			utils = pUtils;
			done();
		});
	});

	it('should exports correct utils object', function(done){

			expect(utils).to.be.a('object');
			expect(utils).to.have.property('getPackagesRoutes');

			done();
	});

	it('should exports correct utils object', function(done){

			expect(utils).to.be.a('object');
			expect(utils).to.have.property('getPackagesRoutes');

			done();
	});

	it('should allow extend packages', function(done){
			var controller1 = {
				routes: {
					'r1': 'r2'
				},
				m1: function () {return 'm1code';}
			},
			controller2 = {
				routes: {
					'r2': 'r3'
				},
				m2: function () {return "m2code";}
			},
			mergedData = utils.getPackagesRoutes([controller1, controller2]);

			expect(mergedData).to.have.property('packagesMethods');
			expect(mergedData).to.have.property('packagesRoutes');

			expect(mergedData.packagesRoutes).to.deep.equal({
				'r2': 'r3',
				'r1': 'r2'
			});

			expect(mergedData.packagesMethods).to.have.property('m1');
			expect(mergedData.packagesMethods.m1).to.be.a('function');
			expect(mergedData.packagesMethods.m1()).to.be.equal('m1code');

			expect(mergedData.packagesMethods).to.have.property('m2');
			expect(mergedData.packagesMethods.m2).to.be.a('function');
			expect(mergedData.packagesMethods.m2()).to.be.equal('m2code');

			done();
	});

});