
Todos.TodoController = Ember.ObjectController.extend
  actions:
    editTodo: ->
      @set 'isEditing', true
    acceptChanges: ->
      @set 'isEditing', false
      if Ember.isEmpty @get('model.title')
        @send 'removeTodo'
      else
        @get('model').save()
    removeTodo: ->
      @get('model')
      .deleteRecord()
      .save()

  isEditing: false

  isCompleted: ((key, value) ->
    model = @get 'model'
    if value == undefined
      return model.get 'isCompleted'
    else
      model.set 'isCompleted', value
      model.save()
      return value
  ).property 'model.isCompleted'


