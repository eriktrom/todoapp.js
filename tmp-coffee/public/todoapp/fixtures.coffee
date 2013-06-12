define("todoapp/fixtures",
  ["todoapp/models/todo"],
  (__dependency1__) ->
    "use strict"
    Todo = __dependency1__.Todo

    Todo.FIXTURES = [
      id: 1,
      title: 'Learn Ember.js',
      isCompleted: true
    ,
      id: 2,
      title: '...',
      isCompleted: false
    ,
      id: 3,
      title: 'Profit!',
      isCompleted: false
    ]
  )