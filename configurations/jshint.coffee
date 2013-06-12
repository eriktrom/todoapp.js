module.exports =
  all:
    src: [
      'tmp/public/**/*.js'
      '!tmp/public/todoapp.js'
      '!tmp/public/vendor/**'
      '!tmp/public/test.js'
    ]
    options:
      jshintrc: '.jshintrc'
      force: true