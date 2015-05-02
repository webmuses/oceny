module Api
  class RejectedSubmissionsController < Api::SubmissionsBaseController
    def index
      render_collection(Submission.rejected.order(:created_at.asc))
    end
  end
end
