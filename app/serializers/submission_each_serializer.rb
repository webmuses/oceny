class SubmissionEachSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :age, :email, :rates_count

  def id
    "#{object.id}"
  end

  def rates_count
    object.rates.count
  end
end
