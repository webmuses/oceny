class Form
  include Mongoid::Document
  include Mongoid::Timestamps
  
  has_many :questions
end
