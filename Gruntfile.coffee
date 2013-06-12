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



  grunt.registerTask 'build', [
    'clean'
    'ember_handlebars'
    'transpile'
    'coffee'
    'jshint'
  ]