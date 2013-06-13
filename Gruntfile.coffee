module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)
  grunt.loadTasks('tasks')

  config = (configFileName) ->
    require("./configurations/#{configFileName}")

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    env: process.env

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
    s3: config('s3')


  grunt.registerTask 'build', [
    'clean'
    'ember_handlebars'
    'transpile'
    'coffee'
    'jshint'
    'copy'
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
    'buildProduction'
    's3:dev'
  ]