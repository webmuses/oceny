class ResultsController < ApplicationController
  def index
    attendees = AttendeeDecorator.decorate_collection(Attendee.includes(:rates).all)
    results = AttendeeSelector.new(attendees).select!

    respond_to do |format|
      format.json { render json: results, each_serializer: AttendeeSingleSerializer }
      format.text { send_data TextExporter.new(results, Attendee.attribute_names).generate }
    end
  end
end
