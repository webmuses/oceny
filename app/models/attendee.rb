class Attendee
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :_id, type: Integer

  has_many :rates

  def next
    self.class.where(:id.gt => id).order(:id.asc).first
  end

  def prev
    self.class.where(:id.lt => id).order(:id.desc).first
  end
end
