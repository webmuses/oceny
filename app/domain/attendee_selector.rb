class AttendeeSelector
  attr_accessor :collection

  def initialize(collection)
    @collection = collection
  end

  def select!
    collection
      .select!{|attendee| attendee.average_rate.finite?}
      .sort_by!{|attendee| attendee.average_rate}
      .reverse!
      .take(50)
  end
end
