class User
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  has_many :rates
end
