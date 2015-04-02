class SubmissionSingleSerializer < ActiveModel::Serializer
  self.root = false

  attributes :id, :name, :email, :age, :place, :experience, :level, :os, :reason,
    :position, :prev_id, :next_id, :average_rate

  has_many :rates
  has_many :comments

  def id
    "#{object.id}"
  end

  def position
    decorated.position + 1
  end

  def prev_id
    decorated.prev ? "#{decorated.prev.id}" : nil
  end

  def next_id
    decorated.next ? "#{decorated.next.id}" : nil
  end

  def average_rate
    decorated.average_rate
  end

  private

    def decorated
      @decorated ||= object.decorate
    end
end