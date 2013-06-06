(function(globals) {
var define, requireModule;

define = null;

requireModule = null;

(function() {
  var registry, seen;
  registry = {};
  seen = {};
  define = function(name, deps, callback) {
    registry[name] = {
      deps: deps,
      callback: callback
    };
  };
  return requireModule = function(name) {
    var callback, dep, deps, exports, mod, reified, value, _i, _len;
    if (seen[name]) {
      return seen[name];
    }
    seen[name] = {};
    if (!registry[name]) {
      throw new Error("Could not find module " + name);
    }
    mod = registry[name];
    deps = mod.deps, callback = mod.callback;
    reified = [];
    for (_i = 0, _len = deps.length; _i < _len; _i++) {
      dep = deps[_i];
      if (dep === 'exports') {
        reified.push(exports = {});
      } else {
        reified.push(requireModule(dep));
      }
    }
    value = callback.apply(this, reified);
    return seen[name] = exports || value;
  };
})();

define("todoapp", ["exports"], function(__exports__) {
  "use strict";
  var Todoapp;
  Todoapp = function() {};
  return __exports__.Todoapp = Todoapp;
});

Ember.TEMPLATES["grandparent/parent/child"] = Ember.Handlebars.template(function anonymous(Handlebars,depth0,helpers,partials,data) {
this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Ember.Handlebars.helpers; data = data || {};
  


  data.buffer.push("Should be nested.");
  
});

Ember.TEMPLATES["simple"] = Ember.Handlebars.template(function anonymous(Handlebars,depth0,helpers,partials,data) {
this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Ember.Handlebars.helpers; data = data || {};
  var buffer = '', hashTypes, hashContexts, escapeExpression=this.escapeExpression;


  data.buffer.push("<p>Hello, my name is ");
  hashTypes = {};
  hashContexts = {};
  data.buffer.push(escapeExpression(helpers._triageMustache.call(depth0, "name", {hash:{},contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push(".</p>");
  return buffer;
  
});
window.todoapp = requireModule('todoapp');
})(window);