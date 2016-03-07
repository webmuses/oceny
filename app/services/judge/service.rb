class Judge::Service
  attr_accessor :submission

  STRATEGIES = [
    Judge::UnderAgeStrategy.new,
    Judge::RailsKnowledgeStrategy.new,
    Judge::HtmlCssKnowledgeStrategy.new,
    Judge::AlreadyAttendStrategy.new,
    Judge::PoorEnglishStrategy.new
  ]

  def initialize(submission)
    self.submission = submission
  end

  def call
    STRATEGIES.each do |strategy|
      if strategy.should_reject?(submission)
        submission.update_attributes(rejected: true)
      end
    end
  end
end
