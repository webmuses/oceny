# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  @route('dashboard', path: '/')
  @route('about')
  @route('attendees')
  @resource('attendee', path: '/attendees/:id')

