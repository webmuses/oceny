App.RejectedSubmissionsRoute = Ember.Route.extend
  model: () =>
    return Ember.$.getJSON('/api/rejected_submissions.json')
