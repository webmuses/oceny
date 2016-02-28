# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  @route 'submissions', { resetNamespace: true, path: '/' },  () ->
  @route 'submission', { resetNamespace: true , path: '/submissions/:id' }
  @route 'pending_submissions', { resetNamespace: true , path: '/submissions/pending'}
  @route 'pending_submission', { resetNamespace: true , path: '/pending_submissions/:id'}
  @route 'rejected_submissions', { resetNamespace: true , path: '/submissions/rejected'}
  @route 'rated_submissions', { resetNamespace: true , path: '/submissions/rated'}
  @route 'form', { resetNamespace: true }, () ->
    @route('edit')
