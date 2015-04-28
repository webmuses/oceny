module Api
  class RatesController < Api::BaseController
    def create
      submission = Submission.find(params[:submission_id])
      rate_creator = RateCreator.new(submission,
                                     current_user,
                                     params[:value])
      rate_creator.call

      render json: submission.rates
    end
  end
end
