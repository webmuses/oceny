App.AttendeeRoute = Ember.Route.extend
  model: (params) =>
    id = params['id']
    return Ember.$.getJSON("/attendees/#{id}")
