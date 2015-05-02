module Api
  class SubmissionsController < Api::SubmissionsBaseController
    def index
      render_collection(Submission.order(:created_at.asc))
    end

    def show
      render json: Submission.find(params[:id]), serializer: SubmissionSingleSerializer
    end
  end
end
