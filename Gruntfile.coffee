module.exports = (grunt) ->
  require('matchdep')
    .filterDev('grunt-*')
    .filter((name) -> name isnt 'grunt-cli')
    .forEach(grunt.loadNpmTasks)
  grunt.loadTasks('grunt/tasks')

  config = (configFileName) ->
    require("./grunt/configurations/#{configFileName}")

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    env: process.env

    clean: ["tmp-coffee", "tmp"]
    ember_handlebars: config('ember_handlebars')
    transpile: config('transpile')
    coffee: config('coffee')
    jshint: config('jshint')
    copy: config('copy')
    sass: config('sass')
    concat: config('concat')
    connect: config('connect')
    watch: config('watch')
    qunit: config('qunit')
    karma: config('karma')
    # deployment
    uglify: config('uglify')
    md5: config('md5')
    s3: config('s3')


  grunt.registerTask 'build', [
    'clean'
    'ember_handlebars'
    'transpile'
    'coffee'
    'jshint'
    'copy'
    'sass'
    'concat'
  ]

  # dev tasks
  grunt.registerTask 'buildDev', [
    'build'
    'index.html'
  ]

  grunt.registerTask 'server', [
    'buildDev'
    'connect'
    'karma:unit'
    'watch'
  ]

  grunt.registerTask 'test', [
    'buildDev'
    'connect'
    'qunit'
  ]

  # production/deployment tasks
  grunt.registerTask 'setProduction', ->
    process.env.BROWSERAPP_ENV = 'production'

  grunt.registerTask 'buildProduction', [
    'build'
    'uglify:all'
    'md5'
    'setProduction'
    'index.html'
  ]

  grunt.registerTask 'deploy', [
    'test'
    'buildProduction'
    's3:dev'
  ]