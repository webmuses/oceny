class SubmissionSelector
  attr_accessor :collection

  def initialize(collection)
    @collection = collection
  end

  def select!
    collection
      .sort_by!{|submission| submission.average_rate}
      .reverse!
  end
end
