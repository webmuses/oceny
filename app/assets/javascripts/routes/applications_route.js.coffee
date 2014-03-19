App.ApplicationsRoute = Ember.Route.extend
  model: () =>
    return Ember.$.getJSON('/applications')
