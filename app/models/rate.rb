class Rate
  include Mongoid::Document

  field :value, type: Integer
  field :nickname, type: String

  belongs_to :user
  belongs_to :submission
end
