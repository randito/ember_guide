Todos.Router.map ->
  @resource 'todos', path: '/', ->
    @route 'index', path: '/'

Todos.TodosRoute = Ember.Route.extend
  model: ->
    @store.find 'todo'

Todos.TodosIndexRoute = Ember.Route.extend
  model: -> @modelFor 'todos'
