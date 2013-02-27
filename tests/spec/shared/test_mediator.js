var expect;

expect = chai.expect;

describe('MediatorTest', function() {
  var mediator;
  mediator = null;
  beforeEach(function(done) {
    return require(['shared/mediator'], function(_mediator) {
      mediator = _mediator;
      return done();
    });
  });
  it('expect that mediator is an object and has listed methods', function(done) {
    var meth, _i, _len, _ref;
    expect(mediator).to.be.a('object');
    _ref = ['on', 'off', 'trigger'];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      meth = _ref[_i];
      expect(mediator).to.have.property(meth);
      expect(mediator[meth]).to.be.a('function');
    }
    return done();
  });
  return it('expect that mediator is able to trigger and handle events', function(done) {
    var eventData;
    eventData = {
      foo: 'bar'
    };
    mediator.on('test:event', function(data) {
      expect(data).to.be.equal(eventData);
      return done();
    });
    return mediator.trigger('test:event', eventData);
  });
});
