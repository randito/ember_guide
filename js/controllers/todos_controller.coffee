Todos.TodosController = Ember.ArrayController.extend
  actions:
    createTodo: ->
      title = @get 'newTitle'
      return unless title.trim()

      @set 'newTitle', ''
      @store.createRecord 'todo',
        title: title
        isCompleted: false
      .save

