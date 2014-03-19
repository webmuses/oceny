App.AttendeesRoute = Ember.Route.extend
  model: () =>
    return Ember.$.getJSON('/attendees')
