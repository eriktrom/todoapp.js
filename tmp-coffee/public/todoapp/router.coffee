define("todoapp/router",
  ["exports"],
  (__exports__) ->
    "use strict"
    Router = Ember.Router.extend()
      # location: 'history'

    Router.map ->
      @resource 'todos', path: '/'

    __exports__.Router = Router
  )