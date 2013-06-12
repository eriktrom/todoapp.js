module.exports =
  options:
    bare: true
  main:
    files: [
      expand: true
      cwd: 'tmp-coffee/'
      src: ['**/*.coffee']
      dest: 'tmp/'
      ext: '.js'
    ]