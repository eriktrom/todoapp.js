import 'todoapp/application' as Application

import 'todoapp/models/todo' as Todo
import 'todoapp/fixtures' as Fixtures

# Ember.LOG_BINDINGS = true
Todoapp = Application.create(
  # LOG_TRANSITIONS: true
  # LOG_TRANSITIONS_INTERNAL: true # will only work with master(after async router commit)
)

# models
Todoapp.Todo = Todo

export Todoapp