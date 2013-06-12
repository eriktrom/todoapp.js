define("todoapp/routes/todos",
  ["exports"],
  (__exports__) ->
    "use strict"
    TodosRoute = Ember.Route.extend
      model: ->
        Todoapp.Todo.find()

    __exports__.TodosRoute = TodosRoute
  )