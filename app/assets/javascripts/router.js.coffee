# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  @resource('attendees')
  @resource('attendee', path: '/attendees/:id')
  @route('results', path: '/results')
  @route('forms', path: '/forms')

App.IndexRoute = Ember.Route.extend
  beforeModel: () ->
    @transitionTo('attendees');
