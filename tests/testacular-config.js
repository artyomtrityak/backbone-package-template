var autoWatch, basePath, browsers, captureTimeout, colors, exclude, files, logLevel, port, reporters, runnerPort, singleRun;

basePath = '../';

files = [
  MOCHA, MOCHA_ADAPTER, {
    pattern: 'tests/vendor/*.js',
    included: true,
    served: true,
    watched: true
  }, {
    pattern: 'app/assets/js/require-2.1.4.js',
    included: true,
    served: true,
    watched: true
  }, 'app/config.js', 'tests/test-config.js', {
    pattern: 'app/*.js',
    included: false,
    served: true,
    watched: true
  }, {
    pattern: 'app/**/*.js',
    included: false,
    served: true,
    watched: true
  }, {
    pattern: 'app/**/*.html',
    included: false,
    served: true,
    watched: true
  }, {
    pattern: 'tests/spec/**/*.js',
    included: true,
    served: true,
    watched: true
  }
];

exclude = [];

reporters = ['progress'];

port = 9876;

runnerPort = 9100;

colors = true;

logLevel = LOG_INFO;

autoWatch = true;

browsers = ['Chrome'];

captureTimeout = 60000;

singleRun = false;
