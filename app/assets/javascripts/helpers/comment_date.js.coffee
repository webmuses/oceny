Ember.Handlebars.helper 'commentDate', (comment) =>
  moment(comment.created_at).format('LLL')
