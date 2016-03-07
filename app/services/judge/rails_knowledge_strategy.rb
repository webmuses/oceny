module Judge
  class RailsKnowledgeStrategy
    def should_reject?(submission)
      [:rails].any? do |key|
        submission.experience[key.to_s] == Submission.experience_answers.last
      end
    end
  end
end
