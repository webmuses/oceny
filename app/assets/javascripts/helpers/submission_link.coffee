Ember.Helper.helper 'submission_link', (submission, options) =>
  id = submission.id
  name = Handlebars.Utils.escapeExpression(submission.fullname)
  scope = 'submissions'
  if !submission.rejected && submission.rates_count < App.Submission.minRatesCount
    scope = 'pending_submissions'
  new Handlebars.SafeString("<a href='#/#{scope}/#{id}'>#{name}</a>")
