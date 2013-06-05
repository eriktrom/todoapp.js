module.exports = (grunt) ->
  barename = 'todoapp'

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    clean: ['dist']

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
      buildTests:
        options: {bare: false}
        src: [
          'tmp/tests.coffee'
        ]
        dest: 'tmp/tests.js'

    browser:
      dist:
        src: "tmp/#{barename}.browser1.js"
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
          'vendor/loader.coffee'
          'tmp/tests.amd.coffee'
          "tmp/#{barename}.amd.coffee"
        ]
        dest: 'tmp/tests.coffee'

    watch:
      options:
        livereload: true
      files: [
        'app/**'
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
            "define",
            "console",
            "require",
            "requireModule",
            "equal",
            "notEqual",
            "notStrictEqual",
            "test",
            "asyncTest",
            "testBoth",
            "testWithDefault",
            "raises",
            "throws",
            "deepEqual",
            "start",
            "stop",
            "ok",
            "strictEqual",
            "module",
            "expect"
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

  # 2. Load grunt tasks used above
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-qunit'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  # 3. setup some tasks
  grunt.registerTask 'default', ['build']

  grunt.registerTask 'build',
                     'Builds a distributable version of <pkg.name>',
                     ['clean',
                      'transpile:amd',
                      'coffee:application',
                      'coffee:browser',
                      'browser:dist',
                      'bytes']

  grunt.registerTask 'test',
                     'Single test run, suitable for CI Server',
                     ['connect',
                      'tests',
                      'qunit',
                      'jshint']

  grunt.registerTask 'tests',
                     'Builds the test package',
                     ['build',
                      'transpile:tests',
                      'buildTests:dist',
                      'coffee:buildTests']

  grunt.registerTask 'server',
                     'Run the tests in the browser',
                     ['build',
                      'tests',
                      'connect',
                      'watch']


  grunt.registerTask 'bytes', -> console.log 'TODO: Add a bytes-tracking task'

  grunt.registerMultiTask 'browser', 'Export object in <%=pkg.name%> to window', ->
    @files.forEach (filepath) ->
      output = ["(function(globals) {"]
      output.push.apply(output, filepath.src.map(grunt.file.read)) # como?
      output.push("window.#{barename} = requireModule('#{barename}');")
      output.push('})(window);')
      grunt.file.write(filepath.dest, output.join("\n"))

  grunt.registerMultiTask 'buildTests', 'Execute the tests', ->
    testFiles = grunt.file.expand('test/tests/**/*_test.coffee')
    @files.forEach (filepath) ->
      output = ['# start']
      output.push.apply(output, filepath.src.map(grunt.file.read))
      testFiles.forEach (testFile) ->
        output.push("requireModule '#{nameFor(testFile)}'")
      grunt.file.write(filepath.dest, output.join("\n"))

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
