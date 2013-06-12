define("todoapp/main",
  ["todoapp/application","todoapp/routes/todos","todoapp/controllers/todo_controller","todoapp/models/todo","todoapp/fixtures","exports"],
  (__dependency1__, __dependency2__, __dependency3__, __dependency4__, Fixtures, __exports__) ->
    "use strict"
    Application = __dependency1__.Application
    TodosRoute = __dependency2__.TodosRoute
    TodoController = __dependency3__.TodoController
    Todo = __dependency4__.Todo
    # routes
    # views
    # controllers
    # models


    Todoapp = Application.create()

    # routes
    Todoapp.TodosRoute = TodosRoute
    # views
    # controllers
    Todoapp.TodoController = TodoController
    # models
    Todoapp.Todo = Todo

    __exports__.Todoapp = Todoapp
  )