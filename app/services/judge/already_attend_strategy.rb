module Judge
  class AlreadyAttendStrategy
    def should_reject?(submission)
      submission.been_before
    end
  end
end
