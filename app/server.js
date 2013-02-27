
define(['exports', 'sinon'], function(exports) {
  exports.start = function() {
    var requests, server;
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
    return _.each(requests, function(req) {
      return server.respondWith(req.method, req.route, [
        200, {
          'Content-Type': 'application/json'
        }, req.response
      ]);
    });
  };
});
