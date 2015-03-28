App.FormIndexController = Ember.ObjectController.extend
  actions:
    edit: () ->
      @transitionToRoute('form.edit')
