module "Todoapp",
  setup: ->
    Ember.run(Todoapp, Todoapp.advanceReadiness)
  teardown: ->
    Todoapp.reset()

test "list of todos", ->
  expect 2
  visit('/')
  .then ->
    equal find('h2').text(), "Welcome to Ember.js"
    equal find('li:first label').text(), "Learn Ember.js"

