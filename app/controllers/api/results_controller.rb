class Api::ResultsController < Api::BaseController
  def index
    attendees = AttendeeDecorator.decorate_collection(Attendee.all)
    results = AttendeeSelector.new(attendees).select!

    render json: results, each_serializer: AttendeeResultSerializer
  end
end
