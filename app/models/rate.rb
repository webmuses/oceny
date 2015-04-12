class Rate
  include Mongoid::Document
  include Mongoid::Timestamps

  field :value, type: Integer
  field :nickname, type: String

  belongs_to :user
  belongs_to :submission
end
