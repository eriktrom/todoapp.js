module.exports =
  all:
    files: [
      expand: true
      cwd: 'tmp/public/'
      src: ['<%=pkg.name%>.js']
      ext: '.min.js'
      dest: 'tmp/public/'
    ,
      expand: true
      cwd: 'tmp/public/vendor/'
      src: '**/*.js'
      ext: '.min.js'
      dest: 'tmp/public/vendor/'
    ]