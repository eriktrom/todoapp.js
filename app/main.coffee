import 'todoapp/application' as Application

import 'todoapp/models/todo' as Todo
import 'todoapp/fixtures' as Fixtures


Todoapp = Application.create()

# models
Todoapp.Todo = Todo

export Todoapp