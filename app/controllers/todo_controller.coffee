TodoController = Ember.ObjectController.extend
  isCompleted: ((key, value) ->
    model = @get('model')
    if !value
      model.get('isCompleted')
    else
      model.set('isCompleted', value)
      model.save()
      value
  ).property('model.isCompleted')

export = TodoController