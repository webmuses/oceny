Ember.Handlebars.helper 'submission_link', (submission, options) =>
  id = submission.id
  name = Handlebars.Utils.escapeExpression(submission.fullname)
  scope = 'submissions'
  console.log(App.Submission.minRatesCount)
  if submission.rates_count < App.Submission.minRatesCount
    scope = 'pending_submissions'
  new Handlebars.SafeString("<a href='#/#{scope}/#{id}'>#{name}</a>")
