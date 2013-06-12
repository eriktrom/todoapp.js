define("todoapp/store",
  ["exports"],
  (__exports__) ->
    "use strict"
    Store = DS.Store.extend
      revision: 13
      adapter: DS.FixtureAdapter

    __exports__.Store = Store
  )