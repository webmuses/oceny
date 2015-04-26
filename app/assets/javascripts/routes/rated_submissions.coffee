App.RatedSubmissionsRoute = Ember.Route.extend
  model: () =>
    return Ember.$.getJSON('/api/submissions/rated.json')
