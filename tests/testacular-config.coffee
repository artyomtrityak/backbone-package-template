# Testacular configuration
# Generated on Tue Jan 29 2013 13:11:10 GMT+0200 (FLE Standard Time)


# base path, that will be used to resolve files and exclude
basePath = '../'


# list of files / patterns to load in the browser
files = [
	MOCHA
	MOCHA_ADAPTER
	{pattern: 'tests/vendor/*.js', included: true, served: true, watched: true}
	{pattern: 'app/assets/js/require-2.1.4.js', included: true, served: true, watched: true}
	'app/config.js'
	'tests/test-config.js'

	{pattern: 'app/assets/json/*.json', included: false, served: true, watched: true}
	{pattern: 'app/*.js', included: false, served: true, watched: true}
	{pattern: 'app/**/*.js', included: false, served: true, watched: true}
	{pattern: 'app/**/*.html', included: false, served: true, watched: true}
	
	{pattern: 'tests/spec/**/*.js', included: true, served: true, watched: true}
]


# list of files to exclude
exclude = [
	
]


# test results reporter to use
# possible values: 'dots', 'progress', 'junit'
reporters = ['progress']


# web server port
port = 9876


# cli runner port
runnerPort = 9100


# enable / disable colors in the output (reporters and logs)
colors = on


# level of logging
# possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
logLevel = LOG_INFO


# enable / disable watching file and executing tests whenever any file changes
autoWatch = on


# Start these browsers, currently available:
# - Chrome
# - ChromeCanary
# - Firefox
# - Opera
# - Safari (only Mac)
# - PhantomJS
# - IE (only Windows)
browsers = ['Chrome']


# If browser does not capture in given timeout [ms], kill it
captureTimeout = 60000


# Continuous Integration mode
# if true, it capture browsers, run tests and exit
singleRun = off

# compile coffee scripts
# preprocessors = {
#     '**/*.coffee': 'coffee'
# };
