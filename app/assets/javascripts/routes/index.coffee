App.IndexRoute = Ember.Route.extend
  beforeModel: () ->
    @transitionTo('submissions');
