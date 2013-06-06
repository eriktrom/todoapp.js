Todoapp.Router.map ->
  @resource 'todos', path: '/'

Todoapp.TodosRoute = Em.Route.extend
  model: ->
    Todoapp.Todo.find()