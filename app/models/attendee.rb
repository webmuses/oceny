class Attendee
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :_id, type: Integer

  has_many :rates

  def next
    self.class.where(:age.gte => age).order(:age.asc).first
  end

  def prev
    self.class.where(:age.lte => age).order(:age.desc).first
  end
end
