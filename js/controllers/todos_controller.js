// Generated by CoffeeScript 1.7.1
(function() {
  Todos.TodosController = Ember.ArrayController.extend({
    actions: {
      createTodo: function() {
        var title;
        title = this.get('newTitle');
        if (!title.trim()) {
          return;
        }
        this.set('newTitle', '');
        return this.store.createRecord('todo', {
          title: title,
          isCompleted: false
        }).save;
      },
      clearCompleted: function() {
        var completed;
        completed = this.filterBy('isCompleted', true);
        completed.invoke('deleteRecord');
        return completed.invoke('save');
      }
    },
    allAreDone: (function(key, value) {
      return !!this.get('length') && this.everyProperty('isCompleted', true);
    }).property('@each.isCompleted'),
    hasCompleted: (function() {
      return this.get('completed') > 0;
    }).property('completed'),
    completed: (function() {
      return this.filterBy('isCompleted', true).get('length');
    }).property('@each.isCompleted'),
    remaining: (function() {
      return this.filterBy('isCompleted', false).get('length');
    }).property('@each.isCompleted'),
    inflection: (function() {
      if (this.get('remaining') === 1) {
        return 'item';
      } else {
        return 'items';
      }
    }).property('remaining')
  });

}).call(this);
