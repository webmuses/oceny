class SubmissionEachSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :age, :email, :rates_count, :average_rate

  def id
    "#{object.id}"
  end

  def rates_count
    object.rates.count
  end

  def average_rate
    decorated.average_rate
  end

  private

  def decorated
    @decorated ||= object.decorate
  end
end
