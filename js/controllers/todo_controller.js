// Generated by CoffeeScript 1.7.1
(function() {
  Todos.TodoController = Ember.ObjectController.extend({
    actions: {
      editTodo: function() {
        return this.set('isEditing', true);
      },
      acceptChanges: function() {
        this.set('isEditing', false);
        if (Ember.isEmpty(this.get('model.title'))) {
          return this.send('removeTodo');
        } else {
          return this.get('model').save();
        }
      },
      removeTodo: function() {
        return this.get('model').deleteRecord().save();
      }
    },
    isEditing: false,
    isCompleted: (function(key, value) {
      var model;
      model = this.get('model');
      if (value === void 0) {
        return model.get('isCompleted');
      } else {
        model.set('isCompleted', value);
        model.save();
        return value;
      }
    }).property('model.isCompleted')
  });

}).call(this);
