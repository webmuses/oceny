class PendingSubmissionSingleSerializer < SubmissionSingleSerializer
  def rates
    object.rates.for_user(serialization_options[:current_user])
  end
end
