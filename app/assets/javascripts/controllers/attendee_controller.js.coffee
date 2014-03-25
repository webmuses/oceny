App.AttendeeController = Ember.ObjectController.extend
  setupController: (controller, attendee) =>
    controller.set('model', attendee)

  actions:
    rate: (model, value) ->
      Ember.$
        .when(Ember.$.post("/attendees/#{model.id}/rates", value: value))
        .then(Ember.$.get("/attendees/#{model.id}", (data) ->
          Ember.set(model, 'rates', data.rates)
          Ember.set(model, 'average_rate', data.average_rate)
      ))

    comment: (model) ->
      el = $('textarea#body')
      body = el.val()
      el.val('')

      Ember.$
        .when(Ember.$.post("/attendees/#{model.id}/comments", body: body))
        .then(Ember.$.get("/attendees/#{model.id}", (data) ->
          Ember.set(model, 'comments', data.comments)
      ))
