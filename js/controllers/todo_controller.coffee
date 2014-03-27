
Todos.TodoController = Ember.ObjectController.extend
  actions:
    editTodo: ->
      @set 'isEditing', true

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


