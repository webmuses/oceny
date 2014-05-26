class AttendeeResultSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :email, :average_rate

  def average_rate
    decorated.average_rate
  end

  private

    def decorated
      @decorated ||= object.decorate
    end
end