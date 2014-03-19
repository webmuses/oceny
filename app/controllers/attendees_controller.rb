class AttendeesController < ApplicationController
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
end
