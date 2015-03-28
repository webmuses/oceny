class Form
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :permalink, type: String
end
