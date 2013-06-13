module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)
  grunt.loadTasks('tasks')

  config = (configFileName) ->
    require("./configurations/#{configFileName}")

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    clean: ["tmp-coffee", "tmp"]
    ember_handlebars: config('ember_handlebars')
    transpile: config('transpile')
    coffee: config('coffee')
    jshint: config('jshint')
    copy: config('copy')
    concat: config('concat')
    connect: config('connect')
    watch: config('watch')
    qunit: config('qunit')
    # deployment
    uglify: config('uglify')
    md5: config('md5')


  grunt.registerTask 'build', [
    'clean'
    'ember_handlebars'
    'transpile'
    'coffee'
    'jshint'
    'copy'
    'concat'
    'index.html'
  ]

  grunt.registerTask 'server', [
    'build'
    'connect'
    'watch'
  ]

  grunt.registerTask 'test', [
    'build'
    'connect'
    'qunit'
  ]

  grunt.registerTask 'assets', [
    'build'
    'uglify:all'
    'md5'
  ]

