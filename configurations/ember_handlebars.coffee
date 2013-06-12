module.exports =
  compile:
    options:
      processName: (filename) ->
        filename.replace(/templates\//,'').replace(/\.hbs$/,'')
    files:
      "tmp/public/<%=pkg.barename%>/templates.js": "templates/**/*.hbs"