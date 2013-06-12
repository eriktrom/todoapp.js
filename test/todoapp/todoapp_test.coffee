import Todoapp from "todoapp/main"

document.write('<div id="ember-testing-container"><div id="ember-testing"></div></div>')
document.write('<style>#ember-testing-container { position: absolute; background: white; bottom: 0; right: 0; width: 640px; height: 384px; overflow: auto; z-index: 9999; border: 1px solid #ccc; } #ember-testing { zoom: 50%; }</style>')

Todoapp.rootElement = '#ember-testing'
Todoapp.setupForTesting()
Todoapp.injectTestHelpers()


module "Todoapp",
  setup: -> Ember.run(Todoapp, Todoapp.advanceReadiness)
  teardown: -> Todoapp.reset()

test "mark todo as completed", ->
  expect 2
  visit('/')
  .then ->
    equal find('li:last').hasClass('completed'), false
  .click('li:last input')
  .then ->
    equal find('li:last').hasClass('completed'), true

test "create a new todo", ->
  expect 1
  visit('/')
  .then ->
    fillIn('#new-todo', "Eat this hamburger")
    click
  .then ->
    find()