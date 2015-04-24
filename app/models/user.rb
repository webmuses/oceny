class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  has_many :rates

  def can_review?
    A9n.reviewers.include?(nickname)
  end
end
