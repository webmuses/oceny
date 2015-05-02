module Api
  class PendingSubmissionsController < Api::SubmissionsBaseController
    def index
      render_collection(Submission.pending.order(:created_at.asc))
    end

    def show
      render json: Submission.find(params[:id]),
             serializer: PendingSubmissionSingleSerializer,
             current_user: current_user
    end
  end
end
