module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)

  config = (configFileName) ->
    require("./configurations/#{configFileName}")

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    clean: ["tmp"]
    ember_handlebars: config('ember_handlebars')


  grunt.registerTask('build', ['clean', 'ember_handlebars'])