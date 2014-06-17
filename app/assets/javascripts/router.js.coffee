# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  @route('attendees', path: '/')
  @resource('attendee', path: '/attendees/:id')
  @route('results', path: '/results')
  @route('forms', path: '/forms')
