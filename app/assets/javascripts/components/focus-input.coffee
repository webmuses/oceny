App.FocusInputComponent = Ember.TextField.extend
  becomeFocused: (() -> this.$().focus()).on('didInsertElement')
