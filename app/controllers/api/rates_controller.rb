class Api::RatesController < Api::BaseController
  def create
    attendee = Attendee.find(params[:attendee_id])

    rate = Rate.find_or_create_by({
      user: current_user,
      attendee: attendee,
      nickname: current_user.nickname
    })
    rate.update_attribute(:value, params[:value])

    render json: attendee.rates
  end
end
