def default_experience
  technologies = Submission.experience_technologies.keys
  best_answer = Submission.experience_answers[-2]
  Hash[technologies.map { |t| [t, best_answer] }]
end
