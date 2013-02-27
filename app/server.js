
define(['exports', 'sinon'], function(exports) {
  exports.start = function() {
    var req, requests, server, _fn, _i, _len;
    server = sinon.fakeServer.create();
    server.autoRespond = true;
    server.autoRespondAfter = 50;
    requests = [
      {
        method: 'GET',
        route: '/test',
        response: '{"id": 12, "comment": "Hey"}'
      }
    ];
    _fn = function(req) {
      return server.respondWith(req.method, req.route, [
        200, {
          'Content-Type': 'application/json'
        }, req.response
      ]);
    };
    for (_i = 0, _len = requests.length; _i < _len; _i++) {
      req = requests[_i];
      _fn(req);
    }
  };
});
