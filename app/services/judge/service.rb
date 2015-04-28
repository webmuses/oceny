class Judge::Service
  attr_accessor :submission, :strategies

  def initialize(submission, strategies)
    self.submission = submission
    self.strategies = strategies
  end

  def call
    strategies.each do |strategy|
      if strategy.should_reject?(submission)
        submission.update_attributes(rejected: true)
      end
    end
  end
end
