module Api
  class RatedSubmissionsController < Api::SubmissionsBaseController
    def index
      render_collection(Submission.unscoped.rated.order(:average_rate.desc))
    end
  end
end
