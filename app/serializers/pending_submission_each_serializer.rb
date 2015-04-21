class PendingSubmissionEachSerializer < SubmissionEachSerializer
  attributes :rates_count

  def rates_count
    object.rates.count
  end
end
