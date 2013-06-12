import Todo from 'todoapp/models/todo'

TodosRoute = Ember.Route.extend
  model: ->
    Todo.find()

export TodosRoute