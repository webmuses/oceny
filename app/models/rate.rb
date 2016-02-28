class Rate
  include Mongoid::Document
  include Mongoid::Timestamps

  field :value, type: Integer
  field :nickname, type: String

  belongs_to :user
  belongs_to :submission

  scope :for_user, ->(user) { where(user_id: user.id) }

  GROUP_BY_HASH = {
    "$group" => {
      "_id" => { "submission_id" => "$submission_id"},
      "count" => { "$sum" => 1 }
    }
  }

  def self.aggregate(opts = {})
    match_hash = opts[:match_hash]
    args = [GROUP_BY_HASH]
    args << match_hash if match_hash
    Rate.collection.aggregate([*args])
  end
end
