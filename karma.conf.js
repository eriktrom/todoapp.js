// Karma configuration
// Generated on Wed Jun 12 2013 18:46:30 GMT-1000 (HST)


// base path, that will be used to resolve files and exclude
basePath = '';


// list of files / patterns to load in the browser
files = [
  QUNIT,
  QUNIT_ADAPTER,

  'tmp/public/vendor/loader.js',
  'tmp/public/vendor/jquery.js',
  'tmp/public/vendor/handlebars-runtime-latest.js',
  'tmp/public/vendor/ember-latest.js',
  'tmp/public/vendor/ember-data-latest.js',

  'tmp/public/todoapp.js',
  'tmp/public/test.js'
];


// list of files to exclude
exclude = [

];


// test results reporter to use
// possible values: 'dots', 'progress', 'junit'
reporters = ['progress', 'growl'];


// web server port
port = 9876;


// cli runner port
runnerPort = 9100;


// enable / disable colors in the output (reporters and logs)
colors = true;


// level of logging
// possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
logLevel = LOG_INFO;


// enable / disable watching file and executing tests whenever any file changes
autoWatch = false;


// Start these browsers, currently available:
// - Chrome
// - ChromeCanary
// - Firefox
// - Opera
// - Safari (only Mac)
// - PhantomJS
// - IE (only Windows)
browsers = ['ChromeCanary'];


// If browser does not capture in given timeout [ms], kill it
captureTimeout = 60000;


// Continuous Integration mode
// if true, it capture browsers, run tests and exit
singleRun = false;
