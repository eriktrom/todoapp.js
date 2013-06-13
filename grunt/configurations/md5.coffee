grunt = require('grunt')

module.exports =
  compile:
    files: [
      expand: true
      cwd: 'tmp/public'
      src: ['**/*']
      dest: 'tmp/md5/'
      filter: 'isFile'
    ]
    options:
      cmd: 'tmp/public/<%=pkg.name%>'
      encoding: null
      keepBasename: true
      keepExtension: true
      after: (fileChanges, options) ->
        manifest = {}
        for key of fileChanges
          file = fileChanges[key]
          from = file.oldPath.replace(/^tmp\/public/, '')
          to = file.newPath.replace(/^tmp\/md5/, '/assets')
          manifest[from] = to
        grunt.file.write('tmp/manifest.json', JSON.stringify(manifest))