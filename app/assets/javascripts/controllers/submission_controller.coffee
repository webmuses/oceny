App.SubmissionController = Ember.Controller.extend
  defaultRates: [5, 4, 3, 2, 1, 0]

  submissionsUrl: (model) ->
    "/api/submissions/#{model.id}.json"

  actions:
    rate: (model, value) ->
      Ember.$
        .when(Ember.$.post("/api/submissions/#{model.id}/rates.json" , value: value))
        .then(Ember.$.get(@submissionsUrl(model), (data) ->
          Ember.set(model, 'rates', data.rates)
          Ember.set(model, 'average_rate', data.average_rate)
      ))

    comment: (model) ->
      el = $('textarea#body')
      body = el.val()
      el.val('')

      Ember.$
        .when(Ember.$.post("/api/submissions/#{model.id}/comments.json", body: body))
        .then(Ember.$.get("/api/submissions/#{model.id}.json", (data) ->
          Ember.set(model, 'comments', data.comments)
      ))
