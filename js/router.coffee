Todos.Router.map ->
  @resource 'todos', path: '/', ( ->
    # empty, so we can accept child routes.  WTF?  Weird
    )

Todos.TodosRoute = Ember.Route.extend
  model: ->
    @store.find 'todo'

Todos.TodosIndexRoute = Ember.Route.extend
  model: -> @modelFor 'todos'
