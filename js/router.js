// Generated by CoffeeScript 1.7.1
(function() {
  Todos.Router.map(function() {
    return this.resource('todos', {
      path: '/'
    }, function() {
      return this.route('index', {
        path: '/'
      });
    });
  });

  Todos.TodosRoute = Ember.Route.extend({
    model: function() {
      return this.store.find('todo');
    }
  });

  Todos.TodosIndexRoute = Ember.Route.extend({
    model: function() {
      return this.modelFor('todos');
    }
  });

}).call(this);
