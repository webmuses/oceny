module Api
  class UsersController < Api::BaseController
    def watching
      submission_id = params[:submission_id]
      current_user.update_attributes(
        last_watched_submission_id: submission_id,
        last_watched_submission_at: DateTime.now
      )

      render json: User.current_watching_for(submission_id, current_user.id)
        .pluck(:nickname)
    end
  end
end
