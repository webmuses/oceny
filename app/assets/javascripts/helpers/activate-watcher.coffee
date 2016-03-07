activateWatcher = (submission) =>
  window.watcher.stop()
  window.watcher.run(submission)
  null
Ember.Helper.helper(activateWatcher)
