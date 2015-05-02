Ember.Handlebars.helper 'formattedDate', (date) =>
  moment(date).format('LLL')
