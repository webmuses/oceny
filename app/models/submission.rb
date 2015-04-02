class Submission
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :fullname, type: String
  field :email, type: String
  field :age, type: Integer
  field :experience, type: Hash
  field :english, type: String
  field :os, type: String
  field :reason, type: String
  field :extra, type: String

  validates :fullname, presence: true
  validates :email, presence: true
  validates :age, presence: true
  validates :experience, presence: true
  validates :english, presence: true
  validates :os, presence: true
  validates :reason, presence: true

  has_many :rates
  has_many :comments

  def experience_technologies
    {
      html: 'HTML',
      css: 'CSS',
      js: 'Javascript',
      databases: 'Databases',
      rails: 'Ruby on Rails',
      programming: 'Any programming language (PHP, C++, etc.)'
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
      'I can read',
      'I can read & listen',
      'I can communicate'
    ]
  end

  def os_answers
    [
      'Mac OS X',
      'Windows',
      'Linux'
    ]
  end
end
