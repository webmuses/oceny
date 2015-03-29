class Submission
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :_id, type: Integer
  field :name, type: String
  field :email, type: String
  field :age, type: String
  field :place, type: String
  field :experience, type: String
  field :level, type: String
  field :os, type: String
  field :reason, type: String

  has_many :rates
  has_many :comments
end
