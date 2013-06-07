module.exports = (grunt) ->
  barename = 'todoapp'
  appname = 'Todoapp'

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    clean: ['dist', 'tmp']

    transpile:
      amd:
        type: 'amd'
        src: [
          "app/#{barename}.coffee"
          "app/*/**/*.coffee"
        ]
        dest: "tmp/#{barename}.amd.coffee"
      tests:
        type: 'amd'
        src: [
          'test/tests.coffee'
          'test/tests/**/*_test.coffee'
        ]
        dest: 'tmp/tests.amd.coffee'

    coffee:
      options:
        bare: true
        join: true
      application:
        src: ["tmp/#{barename}.amd.coffee"]
        dest: 'dist/<%= pkg.name %>-<%= pkg.version %>.amd.js'
      browser:
        src: [
          'vendor/loader.coffee'
          "tmp/#{barename}.amd.coffee"
        ]
        dest: "tmp/#{barename}.browser1.js"
      prepareTests:
        src: [
          'vendor/loader.coffee'
          'tmp/tests.amd.coffee'
          "tmp/#{barename}.amd.coffee"
        ]
        dest: 'tmp/without-templates-tests.js'
      # NOTE: coffee:prepareTests and coffee:browser do almost the same thing, except that prepare
        # tests adds the tests as well. It would nice if we could use browser1 when running
        # prepare tests, but its not a coffee file, so we duplicate the logic
        #
        # Furthermore, browser:dist and buildTests then almost does the next two steps
        # respectively, and again we duplicate.
        #
        # In better news, we did manage to pull out the logic inside the buildTests
        # and browser function, so that's at least not duplicated, but this file in general
        # is still not that clear at all. Try figuring it out. Good luck.
        #
        # Update: buildTest custom task is okay for now but the browser custom task
        # should not be sharing the exact same method as it does. Check backburner.js to
        # for comparison and clean up and clarify this mess. Again, good luck.

    browser:
      dist:
        src: [
          "tmp/#{barename}.browser1.js"
          "tmp/compiled-templates.js"
        ]
        dest: 'dist/<%=pkg.name%>-<%=pkg.version%>.js'

    connect:
      options:
        hostname: '0.0.0.0'
        port: 8000
        base: '.'
      server: {}

    buildTests:
      dist:
        src: [
          'tmp/without-templates-tests.js'
          "tmp/compiled-templates.js"
        ]
        dest: 'tmp/tests.js'

    watch:
      options:
        livereload: true
      files: [
        'app/**/*'
        'vendor/*'
        'test/**/*'
      ]
      tasks: [
        'build'
        'tests'
      ]

    qunit:
      all:
        options:
          urls: ['http://localhost:8000/test']

    jshint:
      # TODO: run jshint on individual files when jshint supports es6 modules
      all:
        src: [
          "dist/<%= pkg.name %>-<%= pkg.version %>.js",
          "tmp/tests.js"
        ]
        options:
          predef: [
            "define"
            "console"
            "require"
            "requireModule"
            "equal"
            "notEqual"
            "notStrictEqual"
            "test"
            "asyncTest"
            "testBoth"
            "testWithDefault"
            "raises"
            "throws"
            "deepEqual"
            "start"
            "stop"
            "ok"
            "strictEqual"
            "module"
            "expect"
            "Em"
            "Ember"
            "#{appname}"
            "DS"
            "visit"
            "find"
          ]
          node:         false
          browser:true
          boss:true
          curly:        false
          debug:        false
          devel:        false
          eqeqeq:true
          evil:true
          forin:        false
          immed:        false
          laxbreak:     false
          newcap:true
          noarg:true
          noempty:      false
          nonew:        false
          nomen:        false
          onevar:       false
          plusplus:     false
          regexp:       false
          undef:true
          sub:true
          strict:       false
          white:        false
          eqnull:true
          # TODO: review the above syntax for true/false. Do you still like it?

    emberTemplates:
      options:
        # strip away root path to template so that compiled-templates.js can have key value pairs mapping filename to compiled template
        templateName: (sourceFile) -> sourceFile.replace('app/templates/', '')
      dist:
        files: [
          'tmp/compiled-templates.js': 'app/templates/**/*.hbs'
        ]


  # 2. Load grunt tasks used above
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-qunit'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-ember-templates'

  # 3. setup some tasks
  grunt.registerTask 'default', ['build']

  grunt.registerTask 'build',
                     'Builds a distributable version of <pkg.name>',
                     ['clean'
                      'transpile:amd'
                      'coffee:application'
                      'coffee:browser'
                      'emberTemplates:dist'
                      'browser:dist'
                      'bytes']

  grunt.registerTask 'test',
                     'Single test run, suitable for CI Server',
                     ['connect',
                      'tests',
                      'qunit',
                      'jshint']

  grunt.registerTask 'tests',
                     'Builds the test package',
                     ['build'
                      'transpile:tests'
                      'coffee:prepareTests'
                      'buildTests:dist']

  grunt.registerTask 'server',
                     'Run the tests in the browser',
                     ['build',
                      'tests',
                      'connect',
                      'watch']


  grunt.registerTask 'bytes', -> console.log 'TODO: Add a bytes-tracking task'

  grunt.registerMultiTask 'browser', 'Export object in <%=pkg.name%> to window', ->
    combineAndWrap.call(@)
    # TODO: something is not right here, consult backburner where the browser
    # and bulidTests tasks inject slightly different requireModule statements.
    # Either this is luck, or I solved it and at the moment don't remember how.
    # Bad and evil coding. This file should be readable and clear as day.

  grunt.registerMultiTask 'buildTests', 'Execute the tests', ->
    combineAndWrap.call(@)

  grunt.registerMultiTask 'transpile', 'Transpile ES6 modules to AMD, CJS, or globals', ->
    Compiler = require('es6-module-transpiler').Compiler
    options = @options # TODO: review grunt docs and explain this.options
      format: 'amd'
      coffee: true
    @files.forEach (f) ->
      contents = f.src.map (path) ->
        compiler = new Compiler(grunt.file.read(path), nameFor(path), options)
        switch options.format
          when 'amd'
            console.log "Compiling #{path} to AMD"
            format = compiler.toAMD
          when 'globals'
            format = compiler.toGlobals
          when 'cjs'
            format = compiler.toCJS
          else
            throw new Error("Invalid format, use 'amd', 'globals' or 'cjs'")
        format.call(compiler)
      grunt.file.write(f.dest, contents.join("\n\n"))

  nameFor = (path) ->
    console.log(path)
    path.match(/^(?:app|test|test\/tests)\/(.*)\.coffee$/)[1]

  combineAndWrap = ->
    @files.forEach (filepath) ->
      output = ["(function(globals) {"]
      output.push.apply(output, filepath.src.map(grunt.file.read)) # TODO: A: using apply removes the comma that would precede the second file
      output.push("requireModule('tests');")
      output.push('})(window);')
      grunt.file.write(filepath.dest, output.join("\n"))