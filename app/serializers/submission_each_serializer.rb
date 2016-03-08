class SubmissionEachSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :age, :email, :rates_count, :average_rate, :created_at, :rejected

  def id
    "#{object.id}"
  end

  def created_at
    object.created_at.strftime("%d-%m-%Y %H:%M:")
  end

  def rates_count
    object.rates.count
  end

  def average_rate
    format("%.2f", object.average_rate) if object.average_rate
  end

  private

  def decorated
    @decorated ||= object.decorate
  end
end
