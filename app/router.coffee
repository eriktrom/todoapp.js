Router = Ember.Router.extend()
  # location: 'history'

Router.map ->
  @resource 'todos', path: '/'

export = Router