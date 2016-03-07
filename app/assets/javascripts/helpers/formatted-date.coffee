formattedDate = (date) =>
  moment(date).format('LLL')

Ember.Helper.helper(formattedDate)

