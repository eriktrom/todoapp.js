import Todoapp from "todoapp"

document.write('<div id="ember-testing-container"><div id="ember-testing"></div></div>')
document.write('<style>#ember-testing-container { position: absolute; background: white; bottom: 0; right: 0; width: 640px; height: 384px; overflow: auto; z-index: 9999; border: 1px solid #ccc; } #ember-testing { zoom: 50%; }</style>')

Todoapp.rootElement = '#ember-testing'
Todoapp.setupForTesting()
Todoapp.injectTestHelpers()

window.integrationTestSetup = ->
  Ember.run(Todoapp, Todoapp.advanceReadiness)
window.integrationTestTeardown = ->
  Todoapp.reset()

requireModule "tests/todoapp_test"

# TODO: understand in full the best way to require and import modules, then refactor
# this if it makes sense. I'm not sure loading each test file here is better than
# requiring a shared helper inside of new test files. Current implementation seems
# inside out, but my mind needs to digest how this works before finding a better solution
