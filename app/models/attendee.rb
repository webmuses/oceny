class Attendee
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :_id, type: Integer

  has_many :rates
  has_many :comments
end
