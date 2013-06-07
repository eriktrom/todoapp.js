module "Todoapp",
  setup: -> integrationTestSetup.call(@)
  teardown: -> integrationTestTeardown.call(@)

test "list of todos", ->
  expect 3
  visit('/')
  .then ->
    equal find('h2').text(), "Welcome to Ember.js"
    equal find('li:first label').text(), "Learn Ember.js"
    equal find('li:first').hasClass('completed'), true
  .click('li:last')
  .then ->
    equal find('li:last').hasClass('completed'), true
