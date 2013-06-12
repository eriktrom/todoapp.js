define("todoapp/application",
  ["todoapp/router","todoapp/store","exports"],
  (__dependency1__, __dependency2__, __exports__) ->
    "use strict"
    Router = __dependency1__.Router
    Store = __dependency2__.Store

    Application = Ember.Application.extend
      Router: Router
      Store: Store

    __exports__.Application = Application
  )