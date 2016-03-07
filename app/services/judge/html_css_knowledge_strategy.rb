module Judge
  class HtmlCssKnowledgeStrategy
    def should_reject?(submission)
      [:html, :css].any? do |key|
        submission.experience[key.to_s] == Submission.experience_answers.first
      end
    end
  end
end
