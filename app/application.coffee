import Router from 'todoapp/router'
import Store from 'todoapp/store'

Application = Ember.Application.extend
  Router: Router
  Store: Store

export Application