class AttendeesController < ApplicationController
  skip_before_action :authenticate, only: [:upload]

  respond_to :html, :json

  def index
    render json: Attendee.order(:age.asc, :id.asc), each_serializer: AttendeeEachSerializer
  end

  def show
    render json: Attendee.find(params[:id]), serializer: AttendeeSingleSerializer
  end

  def upload
    Importer.new(params[:file], Attendee).import

    redirect_to root_path
  end
end
