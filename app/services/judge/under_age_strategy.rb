module Judge
  class UnderAgeStrategy
    MIN_AGE = 18

    def should_reject?(submission)
      submission.age < MIN_AGE
    end
  end
end
