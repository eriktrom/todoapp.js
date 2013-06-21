import Todoapp from "todoapp/main"

document.write('<div id="ember-testing-container"><div id="ember-testing"></div></div>')
document.write('<style>#ember-testing-container { position: absolute; background: gray; bottom: 0; right: 0; width: 640px; height: 384px; overflow: auto; z-index: 9999; border: 1px solid #ccc; } #ember-testing { zoom: 50%; }</style>')

Todoapp.rootElement = '#ember-testing'
Todoapp.setupForTesting()
Todoapp.injectTestHelpers()

module "Todoapp",
  setup: -> Ember.run(Todoapp, Todoapp.advanceReadiness)
  teardown: -> Todoapp.reset()

test "mark last todo as completed", ->
  lastTodo = 'section#main li:last'
  expect 2
  visit('/')
  .then ->
    equal find(lastTodo).hasClass('completed'), false
  .click("#{lastTodo} input")
  .then ->
    equal find(lastTodo).hasClass('completed'), true

