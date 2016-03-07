class Submission
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :fullname, type: String
  field :email, type: String
  field :age, type: Integer
  field :codecademy_username, type: String
  field :about, type: String
  field :experience, type: Hash
  field :english, type: String
  field :os, type: String
  field :been_before, type: Boolean
  field :reason, type: String
  field :extra, type: String
  field :rejected, type: Boolean, default: false
  field :average_rate, type: Float, default: 0.0

  validates :fullname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :codecademy_username, presence: true
  validates :age, presence: true
  validates :about, presence: true
  validates :experience, presence: { message: 'please select answers for all technologies' }
  validates :english, presence: { message: 'please select an answer' }
  validates :os, presence: { message: 'please select an answer' }
  validates :been_before, presence: { message: 'please select an answer' }
  validates :reason, presence: true

  has_many :rates
  has_many :comments

  MIN_RATES_COUNT = 5

  default_scope -> { order(:created_at.asc) }

  scope :pending, -> do
    rated_ids = submission_ids
    matched_ids = submission_ids(match_hash("$lt" => MIN_RATES_COUNT))

    any_of({ :id.in => matched_ids, :rejected => false },
           { :id.nin => rated_ids, :rejected => false })
  end
  scope :rated, -> do
    matched_ids = submission_ids(match_hash("$gte" => MIN_RATES_COUNT))

    where(:id.in => matched_ids, :rejected => false)
  end
  scope :rejected, -> { where(rejected: true) }


  def self.experience_technologies
    {
      html: 'HTML',
      css: 'CSS',
      js: 'Javascript',
      databases: 'Databases',
      rails: 'Ruby on Rails',
      programming: 'Any other programming language (PHP, C++, etc.)'
    }
  end

  def self.experience_answers
    [
      'Never heard of it',
      'Heard of it',
      'I used it',
      'I am fluent in it'
    ]
  end

  def self.english_answers
    [
      'I don\'t speak English',
      'I know English well enough for basic communication',
      'I can communicate fluently - a workshop in English is no biggie for me'
    ]
  end

  def self.os_answers
    [
      'Mac OS X',
      'Windows',
      'Linux'
    ]
  end

  def calculate_average_rate
    values = rates.map(&:value)
    return 0.0 unless values.present?

    values.reduce(0.0, :+) / values.count
  end

  def update_average_rate
    self.average_rate = calculate_average_rate
    self.save
  end

  private

  def self.match_hash(rates_count)
    { "$match" => { "count" => rates_count } }
  end

  def self.submission_ids(match_hash = nil)
    grouped = Rate.aggregate(match_hash: match_hash)
    grouped.map{|v| v["_id"]["submission_id"] }
  end
end
