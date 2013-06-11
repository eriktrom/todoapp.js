module "Todoapp",
  setup: -> integrationTestSetup.call(@)
  teardown: -> integrationTestTeardown.call(@)

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