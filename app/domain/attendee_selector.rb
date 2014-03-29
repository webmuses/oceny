class AttendeeSelector
  attr_accessor :collection

  def initialize(collection)
    @collection = collection
  end

  def select!
    collection
      .sort_by!{|attendee| attendee.average_rate}
      .reverse!
  end
end
