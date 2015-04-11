class Submission
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :fullname, type: String
  field :email, type: String
  field :age, type: Integer
  field :about, type: String
  field :experience, type: Hash
  field :english, type: String
  field :os, type: String
  field :reason, type: String
  field :extra, type: String

  validates :fullname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :age, presence: true
  validates :about, presence: true
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
end
