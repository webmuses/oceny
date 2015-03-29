App.FormEditRoute = Ember.Route.extend
  model: () =>
    return Ember.$.getJSON('/api/form.json')

  setupController: (controller, model) ->
    controller.set('model', model)
    controller.set('location', window.location)
