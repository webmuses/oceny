# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  @route('attendees', path: '/')
  @resource('attendee', path: '/attendees/:id')

