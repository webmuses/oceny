class App.OnlineUsersWatcher
  run: (submission) ->
    callback = =>
      @updateOnlineUsers(submission)

    callback()

    @callbackId = setInterval(callback, window.currentWatchingInteval)

  stop: ->
    clearInterval(@callbackId)

  updateOnlineUsers: (submission) =>
    path = "/api/users/watching/#{submission.id}.json"
    Ember.$.getJSON(path).then (response) ->
      users = response["users"]
      Ember.set(submission, 'usersWatching', users)

window.watcher = new App.OnlineUsersWatcher()
