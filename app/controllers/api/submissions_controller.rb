module Api
  class SubmissionsController < Api::BaseController
    def index
      render json: Submission.order(:created_at.desc), each_serializer: SubmissionEachSerializer
    end

    def show
      render json: Submission.find(params[:id]), serializer: SubmissionSingleSerializer
    end
  end
end
