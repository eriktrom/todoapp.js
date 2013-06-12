TodosRoute = Ember.Route.extend
  model: ->
    Todoapp.Todo.find()

export TodosRoute