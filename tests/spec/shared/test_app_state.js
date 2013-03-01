var expect;

expect = chai.expect;

describe('AppStateTest', function() {
  var appState;
  appState = null;
  beforeEach(function(done) {
    return require(['shared/app_state'], function(_appState) {
      appState = _appState;
      return done();
    });
  });
  it('expect appState should be an object and have listed methods', function(done) {
    var meth, _i, _len, _ref;
    expect(appState).to.be.a('object');
    _ref = ['get', 'set', 'del'];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      meth = _ref[_i];
      expect(appState).to.have.property(meth);
      expect(appState[meth]).to.be.a('function');
    }
    return done();
  });
  return it('expect that appState methods are working correctly', function(done) {
    var key, val;
    key = 'foobar';
    val = {
      42: 9000,
      'hello': 'world',
      undefined: null
    };
    expect(appState.get(key)).to.be.undefined;
    appState.set(key, val);
    expect(appState.get(key)).to.be.equal(val);
    appState.del(key);
    expect(appState.get(key)).to.be.undefined;
    return done();
  });
});
