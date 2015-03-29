class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: String
  field :nickname, type: String

  belongs_to :user
  belongs_to :submission
end
