class Attendee
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :_id, type: Integer
end
