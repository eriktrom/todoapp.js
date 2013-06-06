window.Todoapp = Todoapp = Em.Application.create()

requireModule 'todoapp/router'
requireModule 'todoapp/models/store'
requireModule 'todoapp/models/todo'

export Todoapp