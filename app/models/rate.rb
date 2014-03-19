class Rate
  include Mongoid::Document

  field :value, type: Integer

  belongs_to :user
  belongs_to :attendee
end
