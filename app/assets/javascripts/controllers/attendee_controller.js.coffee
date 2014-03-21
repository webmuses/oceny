App.AttendeeController = Ember.ObjectController.extend
  setupController: (controller, attendee) =>
    controller.set('model', attendee)

  actions:
    rate: (model, value) =>
      Ember.$.post("/attendees/#{model.id}/rate", value: value, =>
        $('button.rate').removeClass('active')
        $("[data-value=#{value}]").addClass('active')
      )
