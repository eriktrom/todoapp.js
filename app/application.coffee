import 'todoapp/router' as Router
import 'todoapp/store' as Store
import 'resolver' as Resolver

Application = Ember.Application.extend
  modulePrefix: 'todoapp'
  Router: Router
  Store: Store
  resolver: Resolver

export = Application