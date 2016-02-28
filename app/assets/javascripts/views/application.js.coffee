App.ApplicationView = Ember.Component.extend
  constructor: ->
    $('#textarea').blur()

  didInsertElement: ->
    this.$().attr(tabindex: 1)
    this.$().focus()

  keyDown: (event) =>
    return if event.target.type == 'textarea'

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

