submissionLink = (params) =>
  submission = params[0]
  name = Handlebars.Utils.escapeExpression(submission.fullname)
  scope = 'submissions'
  if !submission.rejected && submission.rates_count < App.Submission.minRatesCount
    scope = 'pending_submissions'
  new Handlebars.SafeString("<a href='#/#{scope}/#{submission.id}'>#{name}</a>")

App.SubmissionLinkHelper = Ember.Helper.helper(submissionLink)
