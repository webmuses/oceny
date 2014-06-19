App.FormsIndexController = Ember.ObjectController.extend
  actions:
    new: () ->
     @transitionToRoute('/forms/new')