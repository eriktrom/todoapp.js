module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)

  config = (configFileName) ->
    require("./configurations/#{configFileName}")

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    clean: ["tmp"]


  grunt.registerTask('build', ['clean'])