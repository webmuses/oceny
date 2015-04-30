App.IndexRoute = Ember.Route.extend
  beforeModel: () ->
    @transitionTo('pending_submissions')
