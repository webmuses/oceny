App.SubmissionRoute = Ember.Route.extend
  model: (params) =>
    @id = params['id']
    return Ember.$.getJSON("/api/submissions/#{@id}.json")

  activate: =>
    window.watcher.stop()
    window.watcher.run(@id)
