module Api
  class RatesController < Api::BaseController
    def create
      rate_creator = RateCreator.new(params[:submission_id],
                                     current_user,
                                     params[:value])
      rate_creator.call

      render json: submission.rates
    end
  end
end
