# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  @resource 'submissions', () ->
  @resource 'submission', path: '/submissions/:id'
  @resource 'pending_submissions', path: '/submissions/pending'
  @resource 'rejected_submissions', path: '/submissions/rejected'
  @resource 'rated_submissions', path: '/submissions/rated'
  @resource 'form', () ->
    @route('edit')
