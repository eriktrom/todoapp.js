module.exports =
  options:
    livereload: true
  files: [
    'app/**'
    'vendor/**'
    'test/**'
    'templates/**'
  ]
  tasks: [
    'buildDev'
    'karma:unit:run'
  ]