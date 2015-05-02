#= require routes/submission
App.PendingSubmissionRoute = App.SubmissionRoute.extend
  model: (params) =>
    @id = params['id']
    return Ember.$.getJSON("/api/pending_submissions/#{@id}.json")
