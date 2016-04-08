# usage:
# rake export[4.4]
# Output in accepted.csv and rejected.csv
task :export, [:min_rate] => :environment do |t, args|
  min_rate = args[:min_rate]
  accepted = Submission.where(:average_rate.gte => min_rate)
  rejected = Submission.where(:average_rate.lt => min_rate)

  CSV.open("accepted.csv", "wb") do |csv|
    csv << ["Email", "Fullname", "Experience"]
    accepted.map do |submission|
      csv << [submission.email, submission.fullname, submission.experience]
    end
  end

  CSV.open("rejected.csv", "wb") do |csv|
    csv << ["Email"]
    rejected.map do |submission|
      csv << [submission.email]
    end
  end
end
