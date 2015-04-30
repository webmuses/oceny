class SubmissionCreator
  attr_accessor :submission, :judge

  def initialize(submission)
    self.submission = submission
    self.judge = Judge::Service.new(submission)
  end

  def call
    return false unless submission.save

    judge.call

    true
  end
end
