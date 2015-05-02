#=require controllers/submission_controller
App.PendingSubmissionController = App.SubmissionController.extend
  submissionsUrl: (model) ->
    "/api/pending_submissions/#{model.id}.json"
