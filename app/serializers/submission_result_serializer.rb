class SubmissionResultSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :age, :email, :average_rate

  def id
    "#{object.id}"
  end

  def average_rate
    decorated.average_rate
  end

  private

    def decorated
      @decorated ||= object.decorate
    end
end
