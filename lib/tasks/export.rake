# usage:
# rake export[3.33, 4]
# Output in accepted.csv and rejected.csv
task :export, [:waitlist_level, :accepeted_level] => :environment do |t, args|
  accepted = Submission.where(:average_rate.gte => args[:accepeted_level])
  waitlisted = Submission.where(
    :average_rate.gte => args[:waitlist_level],
    :average_rate.lt => args[:accepeted_level]
  )
  rejected = Submission.where(:average_rate.lt => args[:waitlist_level])

  generate_csv(accepted, "accepted")
  generate_csv(waitlisted, "waitlisted")

  CSV.open("rejected.csv", "wb") do |csv|
    csv << ["Email"]
    rejected.map do |submission|
      csv << [submission.email]
    end
  end
end

def generate_csv(submissions, name)
  CSV.open("#{name}.csv", "wb") do |csv|
    csv << ["Email", "Fullname", "Experience"]
    submissions.map do |submission|
      csv << [submission.email, submission.fullname, submission.experience]
    end
  end
end
