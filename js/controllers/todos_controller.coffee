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

  remaining: (->
    @filterBy('isCompleted', false).get('length')
  ).property('@each.isCompleted')

  inflection: (->
    if @get('remaining') == 1 then 'item' else 'items'
  ).property('remaining')

