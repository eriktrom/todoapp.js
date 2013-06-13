module.exports =
  main:
    src: ['tmp/public/<%=pkg.name%>/**/*.js']
    dest: 'tmp/public/<%=pkg.name%>.js'
    options:
      footer: "window.Todoapp = requireModule('<%=pkg.name%>/main').Todoapp;"
  tests:
    src: ['tmp/public/test/**/*.js']
    dest: 'tmp/public/test.js'
    options:
      footer: "Ember.keys(define.registry).forEach(requireModule);"