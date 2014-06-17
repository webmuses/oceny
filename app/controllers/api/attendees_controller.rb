class Api::AttendeesController < Api::BaseController
  def index
    render json: Attendee.all, each_serializer: AttendeeEachSerializer
  end

  def show
    render json: Attendee.find(params[:id]), serializer: AttendeeSingleSerializer
  end
end
