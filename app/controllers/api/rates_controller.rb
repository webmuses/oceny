module Api
  class RatesController < Api::BaseController
    def create
      submission = Submission.find(params[:submission_id])

      rate = Rate.find_or_create_by({
        user: current_user,
        submission: submission,
        nickname: current_user.nickname
      })
      rate.update_attribute(:value, params[:value])

      render json: submission.rates
    end
  end
end
