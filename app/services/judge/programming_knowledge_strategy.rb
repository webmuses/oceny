module Judge
  class ProgrammingKnowledgeStrategy
    def should_reject?(submission)
      submission.experience.any? do |_, answer|
        answer == Submission.experience_answers.last
      end
    end
  end
end
