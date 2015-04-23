class Submission
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :fullname, type: String
  field :email, type: String
  field :age, type: Integer
  field :about, type: String
  field :experience, type: Hash
  field :english, type: String
  field :os, type: String
  field :been_before, type: Boolean
  field :reason, type: String
  field :extra, type: String
  field :rejected, type: Boolean, default: false

  validates :fullname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :age, presence: true
  validates :about, presence: true
  validates :experience, presence: { message: 'please select answers for all technologies' }
  validates :english, presence: { message: 'please select an answer' }
  validates :os, presence: { message: 'please select an answer' }
  validates :been_before, presence: { message: 'please select an answer' }
  validates :reason, presence: true

  has_many :rates
  has_many :comments

  GROUP_BY_HASH = {
    "$group" => {
      "_id" => { "submission_id" => "$submission_id"},
      "count" => { "$sum" => 1 }
    }
  }
  MIN_RATES_COUNT = 2

  scope :pending, -> { with_rates_count( { "$lt" => MIN_RATES_COUNT } ) }
  scope :rated, -> { with_rates_count( { "$gte" => MIN_RATES_COUNT } ) }
  scope :rejected, -> { where(rejected: true) }

  def experience_technologies
    {
      html: 'HTML',
      css: 'CSS',
      js: 'Javascript',
      databases: 'Databases',
      rails: 'Ruby on Rails',
      programming: 'Any other programming language (PHP, C++, etc.)'
    }
  end

  def experience_answers
    [
      'Never heard of it',
      'Heard of it',
      'I used it',
      'I am fluent in it'
    ]
  end

  def english_answers
    [
      'I don\'t speak English',
      'I know English well enough for basic communication',
      'I can communicate fluently - a workshop in English is no biggie for me'
    ]
  end

  def os_answers
    [
      'Mac OS X',
      'Windows',
      'Linux'
    ]
  end

  private

  def self.with_rates_count(rates_count)
    match_hash = { "$match" => { "count" => rates_count } }
    grouped = Rate.collection.aggregate(GROUP_BY_HASH, match_hash)
    ids = grouped.map { |v| v["_id"]["submission_id"] }
    where(:id.in => ids)
  end
end
