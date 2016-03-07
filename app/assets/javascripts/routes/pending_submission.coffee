#= require routes/submission
App.PendingSubmissionRoute = App.SubmissionRoute.extend
  model: (params) =>
    return Ember.$.getJSON("/api/pending_submissions/#{params['id']}.json")
