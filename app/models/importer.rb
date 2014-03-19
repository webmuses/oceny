class Importer
  attr_accessor :file, :klass

  def initialize(file, klass)
    @file = file
    @klass = klass
  end

  def import
    applications.each do |hash|
      klass.find_or_create_by(hash)
    end
  end

  def applications
    header, *lines = file.read.lines

    lines.map{|line| extract_data(line)}
  end

  def extract_data(line)
    id, name, email, age, place, experience, level, os, reason, *other = line.split(/[\t\r\n]/)

    {
      id: id.to_i,
      name: name,
      email: email,
      age: age,
      place: place,
      experience: experience,
      level: level,
      os: os,
      reason: reason
    }
  end
end
