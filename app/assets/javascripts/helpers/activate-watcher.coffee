activateWatcher = (params) =>
  submission = params[0]
  window.watcher.stop()
  window.watcher.run(submission)
  null

App.ActivateWatcherHelper = Ember.Helper.helper(activateWatcher)
