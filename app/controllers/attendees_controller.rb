class AttendeesController < ApplicationController
  skip_before_action :authenticate, only: [:upload]

  respond_to :html, :json

  def index
    render json: Attendee.order(:id.asc), each_serializer: AttendeeEachSerializer
  end

  def show
    render json: Attendee.find(params[:id]), serializer: AttendeeSingleSerializer
  end

  def upload
    Importer.new(params[:file], Attendee).import

    redirect_to '#/attendees'
  end

  def rate
    attendee = Attendee.find(params[:id])

    rate = Rate.find_or_create_by(user: current_user, attendee: attendee)
    rate.update_attribute(:value, params[:value])

    render json: rate
  end
end
