App.FormIndexRoute = Ember.Route.extend
  model: () =>
    return Ember.$.getJSON('/api/form.json')
