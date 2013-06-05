import Todoapp from "todoapp"

module "Todoapp"

test "is an object", ->
  expect 1
  app = new Todoapp()
  ok typeof app is "object"

