module.exports =
  all:
    src: [
      'tmp/public/**/*.js'
      '!tmp/public/<%=pkg.name%>.js'
      '!tmp/public/vendor/**'
      '!tmp/public/test.js'
    ]
    options:
      jshintrc: '.jshintrc'
      force: true