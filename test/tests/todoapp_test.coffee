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
