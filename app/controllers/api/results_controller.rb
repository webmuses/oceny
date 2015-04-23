module Api
  class ResultsController < Api::BaseController
    def index
      submissions = SubmissionDecorator.decorate_collection(Submission.rated)
      results = SubmissionSelector.new(submissions).select!

      render json: results, each_serializer: SubmissionResultSerializer
    end
  end
end
