class PendingSubmissionEachSerializer < SubmissionEachSerializer
  def rates_count
    object.rates.count
  end
end
