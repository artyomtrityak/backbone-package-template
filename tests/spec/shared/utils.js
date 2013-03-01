var expect;

expect = chai.expect;

describe('Utils', function() {
  var g;
  g = {};
  beforeEach(function(done) {
    return require(['shared/utils'], function(_utils) {
      g.utils = _utils;
      return done();
    });
  });
  it('Should export correct utils', function(done) {
    expect(g.utils).to.be.a('object');
    expect(g.utils.bindRoutes).to.be.a('function');
    return done();
  });
  return it('Should bind routes corect', function() {
    var R1, R2, Router, func;
    func = function() {
      return 'ok';
    };
    R1 = (function() {

      function R1() {}

      R1.prototype.routes = {
        'test555': 'test5',
        'test5551': 'test51'
      };

      R1.prototype.test5 = func;

      R1.prototype.test51 = func;

      return R1;

    })();
    R2 = (function() {

      function R2() {}

      R2.prototype.routes = {
        'test666': 'test6'
      };

      R2.prototype.test6 = func;

      return R2;

    })();
    Router = {
      route: sinon.spy()
    };
    g.utils.bindRoutes(Router, [R1, R2]);
    expect(Router.route.callCount).to.be.equals(3);
    expect(Router.route.calledWith('test555', 'test5', func)).to.be.ok;
    return expect(Router.route.calledWith('test666', 'test6', func)).to.be.ok;
  });
});
