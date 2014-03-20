class DashboardController < ApplicationController
  def index
    @attendees = Attendee.count
  end
end
