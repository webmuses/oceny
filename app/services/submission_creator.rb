class SubmissionCreator
  attr_accessor :submission, :judge

  def initialize(submission)
    self.submission = submission
    strategies = [Judge::UnderAgeStrategy.new,
                  Judge::ProgrammingKnowledgeStrategy.new,
                  Judge::AlreadyAttendStrategy.new,
                  Judge::PoorEnglishStrategy.new]
    self.judge = Judge::Service.new(submission, strategies)
  end

  def call
    return false unless submission.save

    judge.call

    true
  end
end
