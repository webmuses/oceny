App.PendingSubmissionsRoute = Ember.Route.extend
  model: () =>
    return Ember.$.getJSON('/api/pending_submissions.json')
