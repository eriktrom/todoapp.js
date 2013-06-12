import Application from 'todoapp/application'
# routes
import TodosRoute from 'todoapp/routes/todos'
# views
# controllers
import TodoController from 'todoapp/controllers/todo_controller'
# models
import Todo from 'todoapp/models/todo'
import 'todoapp/fixtures' as Fixtures


Todoapp = Application.create()

# routes
Todoapp.TodosRoute = TodosRoute
# views
# controllers
Todoapp.TodoController = TodoController
# models
Todoapp.Todo = Todo

export Todoapp