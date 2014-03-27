Todos.Router.map ->
  @resource 'todos', path: '/', ->
    @route 'index', path: '/'
    @route 'active'

Todos.TodosRoute = Ember.Route.extend
  model: ->
    @store.find 'todo'

Todos.TodosActiveRoute = Ember.Route.extend
  model: ->
    @store.filter 'todo', (todo) ->
      !todo.get 'isCompleted'
  renderTemplate: (controller) ->
    @render 'todos/index', controller: controller

Todos.TodosIndexRoute = Ember.Route.extend
  model: -> @modelFor 'todos'
