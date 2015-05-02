module Api
  class RatedSubmissionsController < Api::SubmissionsBaseController
    def index
      render_collection(Submission.rated.order(:created_at.asc))
    end
  end
end
