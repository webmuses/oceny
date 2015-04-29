class App.OnlineUsersWatcher
  run: (submissionId) ->
    callback = =>
      @updateOnlineUsers(submissionId)

    callback()

    @callbackId = setInterval(callback, window.currentWatchingInteval)

  stop: ->
    clearInterval(@callbackId)

  updateOnlineUsers: (submissionId) =>
    path = "/api/users/watching/#{submissionId}.json"
    Ember.$.getJSON(path).then (response) ->
      users = response["users"]
      $("#current-watching-users").text(users.join(", "))

window.watcher = new App.OnlineUsersWatcher()
