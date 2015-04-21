App.PendingSubmissionsRoute = Ember.Route.extend
  model: () =>
    return Ember.$.getJSON('/api/submissions/pending.json')
