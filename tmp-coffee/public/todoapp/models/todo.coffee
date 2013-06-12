define("todoapp/models/todo",
  ["exports"],
  (__exports__) ->
    "use strict"
    Todo = DS.Model.extend
      title: DS.attr('string')
      isCompleted: DS.attr('boolean')

    __exports__.Todo = Todo
  )