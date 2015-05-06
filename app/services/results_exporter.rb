class ResultsExporter
  def self.to_csv(limit, file_name, fields = ['fullname', 'email', 'average_rate'])
    collection = Submission.unscoped.rated.order(:average_rate.desc).limit(limit)

    csv = TextExporter.new(collection, fields).generate

    File.open(file_name, "w") do |f|
      f.write(csv)
    end
  end
end
