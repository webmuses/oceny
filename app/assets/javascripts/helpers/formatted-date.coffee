formattedDate = (params) =>
  date = params[0]
  moment(date).format('LLL')

App.FormattedDateHelper = Ember.Helper.helper(formattedDate)

