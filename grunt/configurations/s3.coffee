module.exports =
  options:
    key: '<%= env.S3_KEY %>'
    secret: '<%= env.S3_SECRET %>'
    bucket: '<%= pkg.name %>'
    gzip: true
    access: 'public-read'
  dev:
    upload: [
      src: 'tmp/md5/<%= pkg.name %>*.js'
      dest: 'assets/'
    ,
      src: 'tmp/md5/vendor/**/*-*.js'
      dest: 'assets/vendor/'
    ,
      src: 'tmp/public/index.html'
      dest: 'index.html'
    ]