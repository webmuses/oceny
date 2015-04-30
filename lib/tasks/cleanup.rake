task cleanup: :environment do
  Submission.all.each do |submission|
    submission.update_average_rate
    Judge::Service.new(submission).call
  end
end
