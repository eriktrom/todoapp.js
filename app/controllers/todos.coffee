TodosController = Ember.ArrayController.extend

  createTodo: ->
    title = @get('newTitle')
    return unless title.trim()

    todo = Todoapp.Todo.createRecord
      title: title
      isCompleted: false

    @set('newTitle', '')

    todo.save()

export = TodosController