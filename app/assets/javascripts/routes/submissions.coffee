App.SubmissionsRoute = Ember.Route.extend
  model: () =>
    return Ember.$.getJSON('/api/submissions.json')
