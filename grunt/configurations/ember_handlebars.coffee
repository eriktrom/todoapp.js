module.exports =
  compile:
    options:
      processName: (filename) ->
        filename.replace(/templates\//,'').replace(/\.hbs$/,'')
    files: [
      src: "templates/**/*.hbs"
      dest: "tmp/public/<%=pkg.name%>/templates.js"
    ]