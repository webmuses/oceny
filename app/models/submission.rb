class Submission
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  FIELD_NAMES = [:name, :email, :age, :place, :experience, :level, :os, :reason]

  FIELD_NAMES.each do |field_name|
    validates field_name, presence: true
    field field_name, type: String
  end

  has_many :rates
  has_many :comments
end
