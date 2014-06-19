App.FormsNewController = Ember.ObjectController.extend
  actions:
    cancel: () ->
      @transitionToRoute('/forms')

    submit: () ->
      Ember.$
        .when(Ember.$.post("/api/forms.json", $('form').serialize()))
        .then(@transitionToRoute('/forms'))
