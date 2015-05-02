module Api
  class RejectedSubmissionsController < Api::SubmissionsBaseController
    def index
      render_collection(Submission.rejected)
    end
  end
end
