import Todoapp from "todoapp"

document.write('<div id="ember-testing-container"><div id="ember-testing"></div></div>')
document.write('<style>#ember-testing-container { position: absolute; background: white; bottom: 0; right: 0; width: 640px; height: 384px; overflow: auto; z-index: 9999; border: 1px solid #ccc; } #ember-testing { zoom: 50%; }</style>')

Todoapp.rootElement = '#ember-testing'
Todoapp.setupForTesting()
Todoapp.injectTestHelpers()
Ember.testing = true

module "Todoapp",
  setup: ->
    Ember.run(Todoapp, Todoapp.advanceReadiness)
  teardown: ->
    Todoapp.reset()

test "is an object", ->
  expect 1
  visit('/')
  equal find('h2').text(), "Welcome to Ember.js"

