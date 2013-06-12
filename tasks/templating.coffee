module.exports = (grunt) ->
  grunt.registerTask 'index.html', 'process index.html', ->
    template = grunt.file.read('public/index.html')

    indexContents = grunt.template.process template,
      data:
        manifestUrl: (path) ->
          path

    grunt.file.write('tmp/public/index.html', indexContents)