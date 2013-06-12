define("todoapp/routes/todos",
  ["todoapp/models/todo","exports"],
  (__dependency1__, __exports__) ->
    "use strict"
    Todo = __dependency1__.Todo

    TodosRoute = Ember.Route.extend
      model: ->
        Todo.find()

    __exports__.TodosRoute = TodosRoute
  )