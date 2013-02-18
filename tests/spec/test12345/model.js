var assert = chai.assert,
    expect = chai.expect,
    should = chai.should();

describe('User', function(){

    it('should save without error', function(done){
    	var yippee = {};
    	yippee.should.be.an('object');
      	console.log('aaa');

      	requirejs(['app/app'], function () {
      		var t2 = {};
      		t2.should.be.an('object');
      		console.log('bbbccc');
      		done();
      	});
    });
})