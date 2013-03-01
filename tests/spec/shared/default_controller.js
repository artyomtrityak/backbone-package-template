var expect;

expect = chai.expect;

describe("Test default controller", function() {
  var s;
  s = {};
  beforeEach(function(done) {
    return require(['shared/default_controller'], function(_Cont) {
      s.Cont = _Cont;
      return done();
    });
  });
  return it('should contain controller methods', function() {
    var contIns;
    expect(s.Cont).to.be.a('function');
    contIns = new s.Cont;
    expect(contIns).to.have.property('beforeRequest');
    expect(contIns).to.have.property('afterRequest');
    return expect(contIns).to.have.property('destructor');
  });
});
