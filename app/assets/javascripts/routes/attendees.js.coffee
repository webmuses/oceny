App.AttendeesRoute = Ember.Route.extend
  model: () =>
    return Ember.$.getJSON('/api/attendees.json')
