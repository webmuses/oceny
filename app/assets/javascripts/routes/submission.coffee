App.SubmissionRoute = Ember.Route.extend
  model: (params) =>
    return Ember.$.getJSON("/api/submissions/#{params['id']}.json")

