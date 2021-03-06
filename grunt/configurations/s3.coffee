module.exports =
  options:
    key: '<%= env.S3_KEY %>'
    secret: '<%= env.S3_SECRET %>'
    bucket: '<%= pkg.s3BucketName %>'
    gzip: true
    access: 'public-read'
  dev:
    upload: [
      src: 'tmp/md5/<%= pkg.name %>*.js'
      dest: 'assets/'
    ,
      src: 'tmp/md5/vendor/**/*.js'
      dest: 'assets/vendor/'
    ,
      src: 'tmp/md5/css/<%= pkg.name %>*.css'
      dest: 'assets/'
    ,
      src: 'tmp/public/index.html'
      dest: 'index.html'
      headers: {'Cache-Control': 'private, max-age=0, must-revalidate'}
    ]