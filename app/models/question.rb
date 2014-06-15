class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :form
end
