module Judge
  class PoorEnglishStrategy
    def should_reject?(submission)
      submission.english == Submission.english_answers.first
    end
  end
end
