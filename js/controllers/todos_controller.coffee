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

    clearCompleted: ->
      completed = @filterBy('isCompleted', true)
      completed.invoke('deleteRecord')
      completed.invoke('save')

  allAreDone: ((key, value) ->
    if value == undefined
      @every (item, index, self) -> item.get('isCompleted', value)
    else
      @every (item, index, self) -> item.set('isCompleted', value)
      value
  ).property('@each.isCompleted')

  hasCompleted: (->
    @get('completed') > 0
  ).property('completed')

  completed: (->
    @filterBy('isCompleted', true).get('length')
  ).property('@each.isCompleted')

  remaining: (->
    @filterBy('isCompleted', false).get('length')
  ).property('@each.isCompleted')

  inflection: (->
    if @get('remaining') == 1 then 'item' else 'items'
  ).property('remaining')

