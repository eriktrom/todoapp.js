module.exports =
  main:
    src: ['tmp/public/<%=pkg.name%>/**/*.js']
    dest: 'tmp/public/<%=pkg.name%>.js'
  tests:
    src: ['tmp/public/test/**/*.js']
    dest: 'tmp/public/test.js'