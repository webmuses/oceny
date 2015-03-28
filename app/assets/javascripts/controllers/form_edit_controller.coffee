App.FormEditController = Ember.ObjectController.extend
  actions:
    cancel: () ->
      @transitionToRoute('form')

    submit: () ->
      Ember.$
        .when(Ember.$.post("/api/form.json", $('form').serialize()))
        .then(@transitionToRoute('form'))
