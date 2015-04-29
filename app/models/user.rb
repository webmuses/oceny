class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  CURRENT_WATCHING_INTERVAL = 10.seconds

  field :last_watched_submission_id, type: BSON::ObjectId
  field :last_watched_submission_at, type: DateTime

  has_many :rates

  scope :current_watching_for, -> (submission_id, current_user_id) do
    where(:last_watched_submission_id => submission_id,
          :last_watched_submission_at.gte => CURRENT_WATCHING_INTERVAL.ago)
    .not.where(id: current_user_id)
  end

  def can_review?
    A9n.reviewers.include?(nickname)
  end
end
