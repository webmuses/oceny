Ember.Handlebars.helper 'submission_link', (submission, options) =>
  id = submission.id
  name = Handlebars.Utils.escapeExpression(submission.fullname)
  new Handlebars.SafeString("<a href='#/submissions/#{id}'>#{name}</a>")
