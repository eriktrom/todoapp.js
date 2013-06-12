module.exports =
  main:
    type: 'amd'
    moduleName: (defaultModuleName) ->
      "todoapp/#{defaultModuleName}"
    files: [
      expand: true
      cwd: 'app/'
      src: ['**/*.coffee']
      dest: "tmp-coffee/public/todoapp/"
    ]

  tests:
    type: 'amd'
    files: [
      expand: true
      cwd: 'test/'
      src: [
        '**/*.coffee'
        '!fixtures/**'
      ]
      dest: 'tmp-coffee/public/test/'
    ]