App.RatedSubmissionsRoute = Ember.Route.extend
  model: () =>
    return Ember.$.getJSON('/api/rated_submissions.json')
