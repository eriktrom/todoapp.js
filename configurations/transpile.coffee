# TODO: file an issue of fix the fact that <%=pkg.name%> doesnt work with this
# grunt package. It works with uglify, jshint, concat and ember_handlebars grunt
# packages, look there for the answer. Then, replace 'todoapp' in the below code
# with <%=pkg.name%>

module.exports =
  main:
    type: 'amd'
    moduleName: (defaultModuleName) ->
      "todoapp/#{defaultModuleName}"
    files: [
      expand: true
      cwd: 'app/'
      src: ['**/*.coffee']
      dest: "tmp-coffee/public/todoapp/"
    ]

  tests:
    type: 'amd'
    files: [
      expand: true
      cwd: 'test/'
      src: ['**/*.coffee']
      dest: 'tmp-coffee/public/test/'
    ]