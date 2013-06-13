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

  grunt.registerTask 'server', [
    'build'
    'index.html'
    'connect'
    'watch'
  ]

  grunt.registerTask 'test', [
    'build'
    'index.html'
    'connect'
    'qunit'
  ]

  grunt.registerTask 'assets', [
    'build'
    'uglify:all'
    'md5'
    'index.html'
  ]

  grunt.registerTask 'deploy', [
    'assets'
    's3:dev'
  ]

  # TODO: index.html task could be better abstracted. Right now, it comes after
  # build when using it in development, but must come after md5 when building
  # for production. We could make two seperate index.html tasks - one for dev
  # and one for production. Then we could add index.html back into the build
  # task, check to see if the production flag is set, and if it is, ignore it.
  # Then we could have a seperate index.production.html task that we register
  # after md5 task inside of assets registerTask. There are likely other ways
  # to make this easier. Furthermore, it would be less error prone to just
  # set the env variable automatically based on which task we run. In other words
  # it seems redundant and error prone to type `BROWSERAPP_ENV=production grunt assets`
  # when we'll never be running grunt assets for a non-production environemnt. We'll
  # see how it plays out though.
  #
  # Summary: the only duplication above is of the index.html task, it is used in
  # server and test and assets, while the only variation of its use is in assets
  #
  # NOTE: the issue arrose b/c index.html was originally listed under build, but
  # when running assets, it checks for the BROWSERAPP_ENV=production flag which,
  # if set, requires tmp/manifest.json which is built with md5(after uglify) and
  # therefore, b/c build runs before the rest of the tasks registered in assets,
  # tmp/manifest.json does not exist yet, and therefore it fails.
  #
  # ^^ condense me when you get a chance.


  # TODO: compress all vendor dependencies into one file
  # TODO: neuter ember to make it smaller