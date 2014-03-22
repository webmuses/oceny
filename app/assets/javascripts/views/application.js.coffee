App.ApplicationView = Ember.View.extend
  didInsertElement: ->
    this.$().attr(tabindex: 1)
    this.$().focus()

  keyDown: (event) =>
    App.Navigator.handle(event.keyCode)

App.Navigator =
  handle: (key) ->
    switch key
      when 37 then @prev()
      when 39 then @next()

  prev: =>
    $('#prev').click()

  next: =>
    $('#next').click()

