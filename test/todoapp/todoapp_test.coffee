import Todoapp from "todoapp/main"

document.write('<div id="ember-testing-container"><div id="ember-testing"></div></div>')
document.write('<style>#ember-testing-container { position: absolute; background: gray; bottom: 0; right: 0; width: 640px; height: 384px; overflow: auto; z-index: 9999; border: 1px solid #ccc; } #ember-testing { zoom: 100%; }</style>')

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

# test "create a new todo", ->
#   lastTodo = 'section#main li:last'
#   expect 1
#   visit("/")
#   .fillIn("input#new-todo", "Eat this hamburger")
#   .then ->
#     equal Ember.$('')


test "create a new todo", ->
  lastTodo = 'section#main li:last'
  expect 2
  visit('/')
  .then ->
    equal find(lastTodo).hasClass('completed'), false
  .fillIn('input#new-todo', "Eat this hamburger")
  .then (value) ->
    equal value, "hello"
    # equal find(lastTodo).hasClass('completed'), false
    # equal find("input#new-todo").val(), "Eat this hamburger"
    # equal find("#{lastTodo} label").text(), 'Eat this hamburger', "that didn't work out"

# TODO: abstract test setup; read code for setupForTesting and injectTestHelpers
# Ember.$('.ember-text-field').val()