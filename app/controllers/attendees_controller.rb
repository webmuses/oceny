class AttendeesController < ApplicationController
  respond_to :html, :json

  def index
    render json: Attendee.all, each_serializer: AttendeeBriefSerializer
  end

  def show
    respond_with(Attendee.find(params[:id]))
  end

  def upload
    Importer.new(params[:file], Attendee).import

    redirect_to '#/attendees'
  end
end