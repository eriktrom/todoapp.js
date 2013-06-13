module.exports = (grunt) ->
  grunt.registerTask 'index.html', 'process index.html', ->
    isProduction = process.env.BROWSERAPP_ENV is 'production' ? true : false

    template = grunt.file.read('public/index.html')
    manifest = grunt.file.readJSON('tmp/manifest.json') if isProduction

    indexContents = grunt.template.process template,
      data:
        manifestUrl: (path) ->
          if isProduction
            path = path.replace(/\.js$/, '.min.js') # add md5 directly before .js
            console.log(process)
            grunt.config.process('<%= pkg.cloudfrontHost %>') + manifest[path]
          else
            path

    grunt.file.write('tmp/public/index.html', indexContents)