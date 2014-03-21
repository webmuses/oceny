class Attendee
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :_id, type: Integer

  has_many :rates

  def next
    list[position + 1]
  end

  def prev
    list[position - 1]
  end

  def position
    list.index{|attendee| attendee.id == id}
  end

  def list
    @list ||= self.class.order(:age.asc, :id.asc).to_a
  end
end
