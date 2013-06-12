define = null
requireModule = null

do ->
  registry = {}
  seen = {}

  define = (name, deps, callback) ->
    registry[name] = {deps, callback}
    return

  requireModule = (name) ->
    return seen[name] if seen[name]
    seen[name] = {}
    throw new Error("Could not find module #{name}") unless registry[name]

    mod = registry[name]
    {deps, callback} = mod
    reified = []

    for dep in deps
      if dep is 'exports'
        reified.push(exports = {})
      else
        reified.push(requireModule(dep))

    value = callback.apply(@, reified)
    seen[name] = exports || value
