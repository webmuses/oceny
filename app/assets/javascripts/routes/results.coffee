App.ResultsRoute = Ember.Route.extend
  model: () =>
    return Ember.$.getJSON('/api/results.json')
