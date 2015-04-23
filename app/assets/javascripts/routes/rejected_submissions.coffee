App.RejectedSubmissionsRoute = Ember.Route.extend
  model: () =>
    return Ember.$.getJSON('/api/submissions/rejected.json')
