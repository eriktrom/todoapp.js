module.exports =
  options:
    livereload: true
  files: [
    'app/**'
    'vendor/**'
    'test/**'
    'templates/**'
    'scss/**'
  ]
  tasks: [
    'buildDev'
    'karma:unit:run'
  ]