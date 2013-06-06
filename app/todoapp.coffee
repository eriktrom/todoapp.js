Todoapp = Em.Application.create();
Todoapp.Store = DS.Store.extend
  revision: 13
  adapter: 'DS.FixtureAdapter'

export Todoapp