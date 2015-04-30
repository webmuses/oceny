task cleanup: :environment do
  Submission.all.each do |submission|
    submission.update_average_rate
    Judge::Service.new(submission).call
  end

  Submission.where(been_before: nil).each do |submission|
    submission.update_attribute(:been_before, false)
  end
end
