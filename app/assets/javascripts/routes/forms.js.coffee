App.FormsRoute = Ember.Route.extend
  model: () =>
    return Ember.$.getJSON('/api/forms.json')
