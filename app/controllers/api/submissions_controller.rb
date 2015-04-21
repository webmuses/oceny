module Api
  class SubmissionsController < Api::BaseController
    def index
      render json: Submission.all, each_serializer: SubmissionEachSerializer
    end

    def show
      render json: Submission.find(params[:id]), serializer: SubmissionSingleSerializer
    end

    def pending
      render json: Submission.pending, each_serializer: PendingSubmissionEachSerializer
    end
  end
end
