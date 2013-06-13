module.exports =
  options:
    livereload: true
  files: [
    'app/**'
    'vendor/**'
    'test/**'
    'templates/**'
    'scss/**'
    'public/**'
  ]
  tasks: [
    'buildDev'
    'karma:unit:run'
  ]